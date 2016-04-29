require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  let(:my_user) { FactoryGirl.create(:user, username: "fake", password: "faker") }
  let(:my_list) { FactoryGirl.create(:list, user: my_user, name: "Lies", permissions: "open") }
  let(:my_item) { FactoryGirl.create(:item, list: my_list, description: "Mark Twain") }
 
  context "unauthenticated users" do
    it "DELETE destroy returns Access denied." do
      delete :destroy, id: my_item.id
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
    it "POST /api/v1/lists/id/items" do
      post :create, list_id: my_list.id, item: {description: "Yankee"}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    it "PUT /api/v1/lists/id/items/id" do
      put :update, list_id: my_list.id, id: my_item.id, item: {completed: true}
      expect( response.status ).to eq( 200 )
      expect( response.content_type ).to eq( Mime::JSON )
    end
    it "DELETE /api/v1/items/id" do
      delete :destroy, id: my_item.id
      expect( response.status ).to eq( 204 )
      expect( response.content_type ).to eq( Mime::JSON )
      expect{ Item.find(my_item.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end