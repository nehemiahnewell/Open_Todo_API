require 'rails_helper'

RSpec.describe List, type: :model do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  
  it { is_expected.to have_many(:items) }
  
  it { is_expected.to belong_to(:user) }
end
