require 'rails_helper'

RSpec.describe ItemSerializer, type: :serializer do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  let(:my_item) { create(:item, list: my_list) }
  
  describe "ItemSerializer"  do
    it "should serialize an item to json" do
      assert_equal "{\"item\":{\"id\":null,\"list\":null,\"description\":null,\"completed\":false}}", ItemSerializer.new(Item.new).to_json
    end
  end
end

