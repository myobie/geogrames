class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    access_token.present?
  end
  helper_method :logged_in?

  def require_login
    unless logged_in?
      status 401
      render "homepage/index"
    end
  end

  def access_token
    session[:access_token]
  end
  helper_method :access_token

  def access_token=(new_token)
    session[:access_token] = new_token
  end
end
