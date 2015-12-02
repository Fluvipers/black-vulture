require 'rails_helper'

feature "Show Tweets report table" do
  context "Existing a tweet line" do
    scenario "should the table report is shown" do
      
      line = FactoryGirl.create(:line, :tweet)
      fact1 = Fact.new()
      fact1.line_id = line.id
      fact1.properties = { id: 14, campaign: 1, influencer: 44, retweets: 43, date: "2013-10-10", status: "activated"}
      fact1.value = 43
      fact1.key = "retweets"
      fact1.save!
      fact2 = Fact.new()
      fact2.line_id = line.id
      fact2.properties = { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10", status: "created"}
      fact2.value = 1
      fact2.key = "retweets"
      fact2.save!
      fact3 = Fact.new()
      fact3.line_id = line.id
      fact3.properties = { id: 673, campaign: 4, influencer: 32, retweets: 17, date: "2013-10-20", status: "activated"}
      fact3.value = 17
      fact3.key = "retweets"
      fact3.save!
      fact4 = Fact.new()
      fact4.line_id = line.id
      fact4.properties = { id: 49, campaign: 1, influencer: 17, retweets: 22, date: "2013-10-20", status: "created"}
      fact4.value = 1
      fact4.key = "status"
      fact4.save!
      fact5 = Fact.new()
      fact5.line_id = line.id
      fact5.properties = { id: 545, campaign: 1, influencer: 44, retweets: 36, date: "2013-10-30", status: "activated"}
      fact5.value = 36
      fact5.key = "retweets"
      fact5.save!
      facts = Fact.all

      visit '/reports/tweets/total_retweets'

      within '#table_report' do
        expect(page).to have_content("Total retweets") 
        expect(page).to have_content(122) 
      end
    end
  end
end
