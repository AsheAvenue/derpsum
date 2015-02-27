module ImagesHelper
  
  def tag_url_list(img)
    raw img.tag_list.map { |t| link_to t, tag_path(t) }.join(', ')
  end
  
end
