require 'rails_helper'

RSpec.describe List, type: :model do
  let(:my_user) { FactoryGirl.create(:user, username: "John", password: "password") }
  let(:my_list) { FactoryGirl.create(:list, user: my_user, name: "John's List", permissions: "open") }
  
  it { is_expected.to have_many(:items) }
  it { is_expected.to belong_to(:user) }
    
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
  it { is_expected.to validate_presence_of(:permissions) }
  it { is_expected.to validate_length_of(:permissions).is_at_least(1) }
  it { is_expected.to validate_presence_of(:user) }
end
