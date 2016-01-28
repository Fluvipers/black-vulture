require 'rails_helper'

RSpec.describe TimeUnit, type: :model do
  it { should validate_presence_of :when }

  context "When creating a new time_unit" do
    context "And there is a 'when' parameter specified" do
      it "Should create the time_unit with the correct parameters" do
        time_unit = TimeUnit.new(when: DateTime.new(2015, 12, 30, 12, 25))

        expect(time_unit.save).to eq true
        expect(time_unit.semester).to eq "2"
        expect(time_unit.quarter).to eq "3"
        expect(time_unit.bimester).to eq "6"
        expect(time_unit.month).to eq "12"
        expect(time_unit.month_of_year).to eq "December"
        expect(time_unit.fortnight).to eq "2"
        expect(time_unit.week_of_year).to eq "53"
        expect(time_unit.week_of_month).to eq "5"
        expect(time_unit.day_of_year).to eq "364"
        expect(time_unit.noon).to eq "PM"
        expect(time_unit.hour).to eq "12"
        expect(time_unit.minute).to eq "25"
        expect(time_unit.time_zone).to eq "UTC"
      end
    end
    context "And there is no 'when' parameter specified" do
      it "Should not create the time_unit" do
        time_unit = TimeUnit.new

        expect(time_unit.valid?).to eq false
        expect(time_unit.save).to eq false
      end
    end
  end
end
