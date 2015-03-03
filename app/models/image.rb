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
  
  
  # Class methods
  
  def self.generate_short_url(url)
    shortener = Bitly.new(ENV["BITLY_USERNAME"], ENV["BITLY_PASSWORD"])
    shortener.shorten(url).short_url
  end
  
end
