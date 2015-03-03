class ImagesController < ApplicationController

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
    
    # Determine if the url has changed
    if params[:image][:url] != @image.url
      changed = true
    end
    
    # Update the image
    if @image.update(image_params)
      flash[:notice] = "image updated!"
      
      # Re-generate the short URL if it's changed
      if changed
        @image.short_url = Image.generate_short_url(@image.url)
        @image.save!
      end
      
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
    img_url = params[:img]
    if [".gif", ".jpg", ".png"].include? File.extname(params[:img]).downcase
      @image = Image.new( { url: params[:img] } )
      render :action => :new
    else
      redirect_to invalid_image_url
    end
  end

  def search
    @images = Image.search(params[:search_string])
    @images = @images.page(params[:page])
    render :index
  end
  
  
  private
  
  def image_params
    params.require(:image).permit(:name, :url, :tag_list, :short_url)
  end
  
end
