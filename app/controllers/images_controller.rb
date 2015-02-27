class ImagesController < ApplicationController

 # before_filter :user_required
 # def user_required
 #     unless current_user
 #     flash[:notice] = "You must be logged in to access this page"
 #     redirect_to new_user_session_url
 #     return false
 #     end
 # end

 def show
 end

 def new
    @image = current_user.images.new
 end

 def create
    @image = current_user.images.new(image_params)
    @image.short_url = Image.generate_short_url(@image.url)

    if @image.save
      flash[:notice] = "Image created."
      redirect_to home_path 
    else
      flash[:notice] = "There was a problem creating the image."
      render :action => :new
    end
  end

  def edit
    @image = current_user.images.find(params[:id]) 
    @image.short_url = generate_short_url(@image.url) if @image.short_url.nil?
  end

  def update
    @image = current_user.images.find(params[:id]) 
    if @image.update(image_params)
      flash[:notice] = "image updated!"
      redirect_to images_url 
    else
      render :action => :edit
    end
  end

  def destroy 
    @image = current_user.images.find(params[:id])
    if current_user.id == @image.user_id
      session[:return_to] ||= request.referer
      @image.delete
      redirect_to session[:return_to]
    end
  end
  
  def index
    @images = params[:tag] ? Image.tagged_with(params[:tag]) : Image.all
    @images = @images.page(params[:page])    
  end

  def my
    @images = current_user.images.page(params[:page]).per(9)
    render :index
  end

  def invalid_image

  end

  def add_from_bookmark
    @img_url = params[:img]
    if valid_image(@img_url) 
      @image = Image.new
      @image.url = @img_url 
      render :action => :new
    else
      redirect_to invalid_image_url
    end
  end

  #methods
  def valid_image(url)
    if [".gif", ".jpg", ".png"].include? File.extname(url).downcase 
      return true
    else
      return false
    end
  end
  
  
  private
  
  def image_params
    params.require(:image).permit(:name, :url, :tag_list, :short_url)
  end
  
end
