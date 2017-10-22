require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "flash_class" do
    it "defines the success class when flash notice is set" do
      expect(helper.flash_class(:notice)).to eq('alert alert-success')
    end
    it "defines the warning class when flash alert is set" do
      expect(helper.flash_class(:warning)).to eq('alert alert-warning')
    end
  end
end