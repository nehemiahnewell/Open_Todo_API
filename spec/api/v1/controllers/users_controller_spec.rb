require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:my_user) { create(:user, username: "fake", password: "faker") }
 
  context "unauthenticated users" do
    it "GET index returns Access denied." do
      get :index
      assert_equal "HTTP Basic: Access denied.", response.body.chop
    end
  end
 
  context "authenticated users" do
    it "GET index returns index of users" do
      get :index #full path goes here
      # good retun goes here
    end
  end
end