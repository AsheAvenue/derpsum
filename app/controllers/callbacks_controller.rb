class CallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
    allowed_domains = ENV['ALLOWED_DOMAINS'].split(',')
    domain_from_omniauth = request.env['omniauth.auth'][:info][:email]
    domain = domain_from_omniauth.split('@')[1]
    if allowed_domains.include? domain
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    else
      @error = true
      render 'home/index'
    end
  end
  
end