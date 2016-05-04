require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  let(:my_user) { FactoryGirl.create(:user, username: "fake", password: "faker") }
  let(:my_list) { FactoryGirl.create(:list, user: my_user, name: "Lies", permissions: "public") }
 
  context "unauthenticated users" do
    it "GET index returns Access denied." do
      get :index, user_id: my_user.id
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
    
    it "GET /api/v1/users/id/lists" do
      get :index, user_id: my_user.id
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    
    it "GET /api/v1/user/id/lists/id" do
      get :index, user_id: my_user.id, id: my_list.id {}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    
    it "PUT /api/v1/user/id/lists/id" do
      put :update, user_id: my_user.id, id: my_list.id, list: {name: "Real", permissions: "private"}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    
    it "POST /api/v1/user/id/lists" do
      post :create, user_id: my_user.id, list: {name: "Statistics", permissions: "Discrsion"}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    
    it "DELETE /api/v1/user/id/lists/id" do
      delete :destroy, user_id: my_user.id, id: my_list.id
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
      expect{ List.find(my_list.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end