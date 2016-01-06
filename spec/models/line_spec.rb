require 'rails_helper'

RSpec.describe Line, type: :model do
  it { should validate_presence_of :name }

  context "Create a line with a name that already exists" do
    context "and the name is exactly the same" do
      it "should not create the line" do
        line = FactoryGirl.create(:line, :tweet)
        new_line = Line.new
        new_line.name = 'tweet'

        new_line.valid?

        expect(new_line.errors.messages[:name][0]).to eq "There is already a line with that name"
        expect(new_line.save).to eq false
        expect(Line.count).to eq 1
      end
    end

    context "and the name has some capitalized letters" do
      it "should not create the line" do
        line = FactoryGirl.create(:line, :tweet)
        new_line = Line.new
        new_line.name = 'TwEet'

        new_line.valid?

        expect(new_line.errors.messages[:name][0]).to eq "There is already a line with that name"
        expect(new_line.save).to eq false
        expect(Line.count).to eq 1
      end
    end
  end
end
