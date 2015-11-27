require 'rails_helper'

feature "Show Tweets report table" do
  context "Existing a tweet line" do
    scenario "should the table report is shown" do
      
      line = FactoryGirl.create(:line)
      fact = Fact.new()
      fact.properties = [
        { id: 14, campaign: 1, influencer: 44, retweets: 43, date: "2013-10-10", status: "activated"},
        { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10", status: "created"},
        { id: 673, campaign: 4, influencer: 32, retweets: 17, date: "2013-10-20", status: "activated"},
        { id: 49, campaign: 1, influencer: 17, retweets: 22, date: "2013-10-10", status: "created"},
        { id: 545, campaign: 1, influencer: 44, retweets: 36, date: "2013-10-30", status: "activated"},
        { id: 83, campaign: 5, influencer: 18, retweets: 38, date: "2013-10-10", status: "activated"},
        { id: 753, campaign: 2, influencer: 32, retweets: 23, date: "2013-10-20", status: "created"},
        { id: 21, campaign: 6, influencer: 44, retweets: 32, date: "2013-10-10", status: "activated"},
        { id: 9, campaign: 5, influencer: 11, retweets: 43, date: "2013-10-10", status: "archived"},
        { id: 140, campaign: 1, influencer:32, retweets: 38, date: "2013-10-30", status: "archived"}]
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

        fact.properties.each do |p|
          expect(page).to have_css("#tweet_#{p["id"]}")
          within "#tweet_#{p["id"]}" do
            expect(page).to have_content(p["id"])
            expect(page).to have_content(p["campaign"])
            expect(page).to have_content(p["influencer"])
            expect(page).to have_content(p["retweets"])
            expect(page).to have_content(p["date"])
            expect(page).to have_content(p["status"])
          end
        end
      end
    end
  end
end
