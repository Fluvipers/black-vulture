require 'rails_helper'

feature "Show Tweets report table" do
  context "Existing a tweet line" do
    scenario "should the table report is shown" do
      
      line = FactoryGirl.create(:line)
      fact = Fact.new()
      fact.properties = [
        { id: 1, campaign: 4, influencer: 2235, retweets: 43, date: "2013-10-10", status: "activated"},
        { id: 2, campaign: 5, influencer: 4234, retweets: 26, date: "2013-10-10", status: "created"},
        { id: 3, campaign: 3, influencer: 6243, retweets: 17, date: "2013-10-20", status: "activated"},
        { id: 4, campaign: 4, influencer: 7322, retweets: 22, date: "2013-10-10", status: "created"},
        { id: 5, campaign: 4, influencer: 6234, retweets: 36, date: "2013-10-30", status: "activated"},
        { id: 6, campaign: 7, influencer: 1234, retweets: 38, date: "2013-10-10", status: "activated"},
        { id: 7, campaign: 8, influencer: 1132, retweets: 23, date: "2013-10-20", status: "created"},
        { id: 8, campaign: 5, influencer: 1124, retweets: 32, date: "2013-10-10", status: "activated"},
        { id: 9, campaign: 4, influencer: 6123, retweets: 43, date: "2013-10-10", status: "archived"},
        { id: 10, campaign:14, influencer:3212, retweets: 38, date: "2013-10-30", status: "archived"}]
      fact.line_id = line.id
      fact.value = 50
      fact.save!
      visit reports_path

      within '#table_report' do
        expect(page).to have_content("id") 
        expect(page).to have_content("campaign") 
        expect(page).to have_content("influencer") 
        expect(page).to have_content("retweets") 
        expect(page).to have_content("date") 
        expect(page).to have_content("status") 
        expect(page).to have_content("2013-10-30") 
        expect(page).to have_content("6243") 
        expect(page).to have_content("3212") 
        expect(page).to have_content("2013-10-30") 
        expect(page).to have_content("2013-10-20") 
        expect(page).to have_content("activated") 
      end
    end
  end
end
