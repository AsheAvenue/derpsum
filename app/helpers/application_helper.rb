module ApplicationHelper
  
  def get_bookmarklet_url
    return Rails.env.production? ? request.host : "#{request.host}:#{request.port}"
  end
  
end
