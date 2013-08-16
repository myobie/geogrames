require 'spec_helper'

describe AuthorizationsController do
  describe "GET #connect" do
    before { get :connect }
    it { expect(response).to be_redirect }
  end

  describe "GET #callback" do
    let(:api_response) { Struct.new(:access_token).new("abc") }
    before {
      expect(Instagram).to receive(:get_access_token).and_return(api_response)
      get :callback
    }
    it { expect(response).to redirect_to(map_path) }
    it { expect(session[:access_token]).to eq "abc" }
  end

  describe "GET #disconnect" do
    before { get :disconnect }
    it { expect(response).to redirect_to(root_path) }
  end
end
