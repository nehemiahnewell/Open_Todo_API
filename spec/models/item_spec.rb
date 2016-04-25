require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  let(:my_item) { create(:item, list: my_list) }
  
  it { is_expected.to belong_to(:list) }
end
