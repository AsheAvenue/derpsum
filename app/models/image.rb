class Image < ActiveRecord::Base
  
  acts_as_taggable
  
  belongs_to :user
  
  validates :name, :presence => true
  validates :url, :presence => true
  
  
  # Scopes
  
  scope :search,   ->(search_t) { joins(:tags).where("tags.name like ?", "#{search_t}%")}

  
  # Other methods
  
  def img_url
    return self.short_url.nil? ? self.url : self.short_url
  end
  
  def extract_first_frame
    temp_image = MiniMagick::Image.open(self.url)
    file_name = "#{Rails.root}/tmp/myfile_#{Process.pid}.jpg"
    temp_image.format "jpeg"
    temp_image.write file_name
    return file_name
  end
  
  
  # Class methods
  
  def self.generate_short_url(url)
    shortener = Bitly.new(ENV["BITLY_USERNAME"], ENV["BITLY_PASSWORD"])
    shortener.shorten(url).short_url
  end
  
  def self.upload_image_to_s3(image_path, filename)
    s3_access_key_id = ENV['S3_ACCESS_KEY']
    s3_secret = ENV['S3_SECRET']
    s3_bucket = ENV['S3_BUCKET']
    s3_subdirectory = ENV['S3_DIRECTORY']
    
    object = Aws::S3::Object.new(
      region:       'us-east-1',
      bucket_name:  s3_bucket,
      key:          "#{s3_subdirectory}/#{filename}",
      access_key_id:     s3_access_key_id,
      secret_access_key: s3_secret
    )
    
    object.upload_file(image_path, {
      acl: 'public-read'
    })
    
    object.public_url
  end
  
  
  
  private
  
  def compute_part_size(options)
    max_parts = 1000
    min_size  = 5242880 #5 MB
    estimated_size = options[:estimated_content_length]
    [(estimated_size.to_f / max_parts).ceil, min_size].max.to_i
  end
  
end
