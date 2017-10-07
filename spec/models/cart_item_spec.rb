require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:cart_item)).to be_valid
    end
  end
end
