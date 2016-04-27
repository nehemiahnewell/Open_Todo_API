require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  let(:my_user) { create(:user, username: 'fake', password: 'faker') }

  describe "authenticated" do
    it "authenticated" do
    end
    it "doesn't authenticate" do
    end
  end
  describe "malformed_request" do
    it "Isn't malformed" do
    end
    it "malformed" do
    end
  end
  describe "malformed_request" do
    it "Isn't found" do
    end
    it "found" do
    end
  end
end