class PhotosController < ApplicationController
  respond_to :json

  before_filter :require_login

  def index
    client = Instagram.client(access_token: access_token)
    respond_with client.media_search(params.require(:latitude), params.require(:longitude))
  end
end
