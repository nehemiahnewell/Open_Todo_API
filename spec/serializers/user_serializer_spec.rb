require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:my_user) { create(:user) }

  describe "ListSerializer"  do
    it "should serialize an user to json" do
      assert_equal "{\"user\":{\"id\":null,\"username\":null,\"password\":null}}", UserSerializer.new(User.new).to_json
    end
  end
end