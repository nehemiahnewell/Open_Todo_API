require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:my_user) { FactoryGirl.create(:user, username: "John", password: "password") }
  let(:my_list) { FactoryGirl.create(:list, user: my_user, name: "John's List", permissions: "open") }
  let(:my_item) { FactoryGirl.create(:item, list: my_list, description: "Not Random") }
  
  it { is_expected.to belong_to(:list) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_least(1) }
  it { is_expected.to validate_presence_of(:list) }
  
end
