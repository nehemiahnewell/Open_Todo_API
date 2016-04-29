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
    it "GET /api/v1/user/id" do
      get :index, id: my_user.id {}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    it "PUT /api/v1/user/id" do
      put :update, id: my_user.id, user: {username: "real", password: "realer"}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
      assert_equal "{\"user\":{\"id\":1,\"username\":\"real\",\"password\":\"realer\"}}", response.body
    end
    it "POST /api/v1/user/" do
      post :create, user: {username: "fakest", password: "fakester"}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
      assert_equal "{\"user\":{\"id\":2,\"username\":\"fakest\",\"password\":\"fakester\"}}", response.body
    end
    it "DELETE /api/v1/user/id" do
      delete :destroy, id: my_user.id
      expect( response.status ).to eq( 204 )
      expect( response.content_type ).to eq( Mime::JSON )
      expect{ User.find(my_user.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end