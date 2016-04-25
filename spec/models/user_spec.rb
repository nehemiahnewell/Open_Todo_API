require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }
  
  it { is_expected.to have_many(:lists) }
end
