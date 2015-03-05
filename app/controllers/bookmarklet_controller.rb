class BookmarkletController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  def bookmarklet
    respond_to do |format|
      format.html { redirect_to "/bookmarklet.js" }
      format.js
    end
  end

end
