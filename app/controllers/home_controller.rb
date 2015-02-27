class HomeController < ApplicationController

  skip_before_action :authenticate_user!
  
  def index
    redirect_to images_path if current_user
  end
  
end
