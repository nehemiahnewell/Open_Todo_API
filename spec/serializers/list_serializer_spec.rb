require 'rails_helper'

RSpec.describe ListSerializer, type: :serializer do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  let(:my_item) { create(:item, list: my_list) }
  
  describe "ListSerializer"  do
    it "should serialize an item to json" do
      assert_equal "{\"list\":{\"id\":null,\"name\":null,\"user\":null,\"permissions\":null}}", ListSerializer.new(List.new).to_json
    end
  end
end

