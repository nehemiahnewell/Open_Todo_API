require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:my_user) { FactoryGirl.create(:user, username: "fake", password: "faker") }
 
  context "unauthenticated users" do
    it "GET index returns Access denied." do
      get :index
      expect( response.status ).to eq( 401 )
    end
  end
 
  context "authenticated users" do
    before do
      # User.find_or_create_by!(username: "fake", password: "faker")
      basic = ActionController::HttpAuthentication::Basic
      @credentials = basic.encode_credentials( my_user.username, my_user.password )
      request.env['HTTP_AUTHORIZATION'] = @credentials
    end
    
    it "GET /api/v1/users" do
      get :index, {}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
  end
end