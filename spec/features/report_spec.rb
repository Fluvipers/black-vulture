require 'rails_helper'

feature "Show Tweets report table" do
  context "Existing a tweet line" do
    scenario "should the table report is shown" do
      
      line = FactoryGirl.create(:line)
      Fact.create(line: line, value: 43, key: 'tweet', properties: { id: 14, campaign: 1, influencer: 44, retweets: 43, date: "2013-10-10", status: "activated"})
      Fact.create(line: line, value: 26, key: 'tweet', properties: { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10", status: "created"})
      Fact.create(line: line, value: 17, key: 'tweet', properties: { id: 673, campaign: 4, influencer: 32, retweets: 17, date: "2013-10-20", status: "activated"})
      Fact.create(line: line, value: 22, key: 'tweet', properties: { id: 49, campaign: 1, influencer: 17, retweets: 22, date: "2013-10-10", status: "created"})
      Fact.create(line: line, value: 36, key: 'tweet', properties: { id: 545, campaign: 1, influencer: 44, retweets: 36, date: "2013-10-30", status: "activated"})
      Fact.create(line: line, value: 38, key: 'tweet', properties: { id: 83, campaign: 5, influencer: 18, retweets: 38, date: "2013-10-10", status: "activated"})
      Fact.create(line: line, value: 23, key: 'tweet', properties: { id: 753, campaign: 2, influencer: 32, retweets: 23, date: "2013-10-20", status: "created"})
      Fact.create(line: line, value: 32, key: 'tweet', properties: { id: 21, campaign: 6, influencer: 44, retweets: 32, date: "2013-10-10", status: "activated"})
      Fact.create(line: line, value: 43, key: 'tweet', properties: { id: 9, campaign: 5, influencer: 11, retweets: 43, date: "2013-10-10", status: "archived"})
      Fact.create(line: line, value: 38, key: 'tweet', properties: { id: 140, campaign: 1, influencer:32, retweets: 38, date: "2013-10-30", status: "archived"})

      visit reports_path

      within '#table_report' do
        expect(page).to have_content("id") 
        expect(page).to have_content("campaign") 
        expect(page).to have_content("influencer") 
        expect(page).to have_content("retweets") 
        expect(page).to have_content("date") 
        expect(page).to have_content("status") 

        Fact.all.each do |fact|
          expect(page).to have_css("#tweet_#{fact.properties["id"]}")
          within "#tweet_#{fact.properties["id"]}" do
            expect(page).to have_content(fact.properties["id"])
            expect(page).to have_content(fact.properties["campaign"])
            expect(page).to have_content(fact.properties["influencer"])
            expect(page).to have_content(fact.properties["retweets"])
            expect(page).to have_content(fact.properties["date"])
            expect(page).to have_content(fact.properties["status"])
          end
        end
      end
    end
  end
end
