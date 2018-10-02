class AuthCallbacksController < ApplicationController
  before_action :get_user, only: [:facebook, :google_oauth2]

  def facebook
    handle_user_auth 'facebook'
  end

  def google_oauth2
    handle_user_auth 'google'
  end

  private

  def get_user
    # Get the user if they already signed up with the provider, else create it
    identity = Identity.find_with_omniauth(request.env["omniauth.auth"])
    @user = identity && identity.user || User.find_from_identity(identity, request.env["omniauth.auth"])
  end

  def handle_user_auth(provider)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      flash[:success] = "You have logged in with #{provider}."
      # set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]["info"] # Not to overflow default 4kb of cookies
      redirect_to new_user_registration_url
    end
  end

end
