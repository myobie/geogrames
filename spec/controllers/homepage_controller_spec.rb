require 'spec_helper'

describe HomepageController do
  describe "GET #index" do
    context "not logged in" do
      before { get :index }
      it { expect(response).to be_success }
    end

    context "logged in" do
      before {
        session[:access_token] = "abc"
        get :index
      }
      it { expect(response).to redirect_to(map_path) }
    end
  end
end
