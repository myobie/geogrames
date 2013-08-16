class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    session[:access_token].present?
  end
end
