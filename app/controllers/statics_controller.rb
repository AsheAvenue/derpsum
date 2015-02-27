class StaticsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, if: :drp
  
  def tools
    
  end

  def invalid_image

  end

  def drp
    respond_to do |format|
      format.html { redirect_to "/drp.js" }
      format.js
    end

  end

end
