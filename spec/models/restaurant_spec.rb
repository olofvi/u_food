require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject do
    create(:restaurant)
  end
end
