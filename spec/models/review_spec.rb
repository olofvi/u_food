require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :rating }
    it { is_expected.to have_db_column :comment }
  end
end

