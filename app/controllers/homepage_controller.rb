class HomepageController < ApplicationController
  def index
    if logged_in?
      redirect_to map_path
    else
      render
    end
  end
end
