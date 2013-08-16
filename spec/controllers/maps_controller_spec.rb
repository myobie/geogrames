require 'spec_helper'

describe MapsController do
  describe "GET #index" do
    before { get :index }
    it { expect(response).to be_success }
  end
end
