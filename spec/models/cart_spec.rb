require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:cart)).to be_valid
    end
  end
end
