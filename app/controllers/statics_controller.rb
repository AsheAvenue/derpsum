class StaticsController < ApplicationController
  def about
  end

  def help
  end

  def contact
  end
  
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
