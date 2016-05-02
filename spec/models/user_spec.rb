require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { FactoryGirl.create(:user, username: "John", password: "password") }
  
  it { is_expected.to have_many(:lists) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(1) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(1) }
end
