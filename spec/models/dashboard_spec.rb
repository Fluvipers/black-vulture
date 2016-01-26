require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  it { should validate_presence_of :name }

  describe "When a dashboard is created should create url's screen_name" do
    it "#url_assign should create url" do

      expect(Dashboard.count).to eq 0

      dashboard = Dashboard.create!(name: 'wendy')
puts dashboard.inspect
puts dashboard.url

      expect(Dashboard.count).to eq 1
      expect(dashboard.url).to eq "#{ENV["BLACK_VULTURE_URL"]}/dashboard/#{dashboard.id}"
    end
  end
end
