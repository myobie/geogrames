class AuthorizationsController < ApplicationController
  def connect
    redirect_to Instagram.authorize_url(redirect_uri: oauth_callback_url)
  end

  def callback
    api_response = Instagram.get_access_token(params[:code], redirect_uri: oauth_callback_url)
    if api_response.access_token
      self.access_token = api_response.access_token
      redirect_to map_path
    else
      reset_session
      redirect_to root_path
    end
  end

  def disconnect
    reset_session
    redirect_to root_path
  end
end
