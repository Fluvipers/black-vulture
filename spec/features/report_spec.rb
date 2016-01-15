require 'rails_helper'

feature "Show Tweets report table" do
  context "Existing a tweet line" do
    let(:user) {FactoryGirl.create(:user)}
    context "With correct property filters called in query string" do
      scenario "Should show the report table" do

        line = FactoryGirl.create(:line, :tweet_line)
        fact1 = Fact.new()
        fact1.line_id = line.id
        fact1.properties = { id: 14, campaign: 1, influencer: 44, retweets: 43, date: "2013-10-10", status: "activated"}
        fact1.save!
        fact2 = Fact.new()
        fact2.line_id = line.id
        fact2.properties = { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10", status: "created"}
        fact2.save!
        fact3 = Fact.new()
        fact3.line_id = line.id
        fact3.properties = { id: 673, campaign: 4, influencer: 32, retweets: 17, date: "2013-10-20", status: "activated"}
        fact3.save!
        fact4 = Fact.new()
        fact4.line_id = line.id
        fact4.properties = { id: 49, campaign: 1, influencer: 17, retweets: 22, date: "2013-10-20", status: "created"}
        fact4.save!
        fact5 = Fact.new()
        fact5.line_id = line.id
        fact5.properties = { id: 545, campaign: 1, influencer: 44, retweets: 36, date: "2013-10-30", status: "activated"}
        fact5.save!

        visit new_user_session_path

        within("#new_user") do
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Log in"
        end


        visit 'reports/tweet/?filters=campaign:1,influencer:44&aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer'
        within '#table_report' do
          expect(page).to have_content("influencer")
          expect(page).to have_content(79)
        end
      end
    end
    context "With wrong property filters called in query string" do
      scenario "Should show an error Message" do

        line = FactoryGirl.create(:line, :tweet_line)
        fact1 = Fact.new()
        fact1.line_id = line.id
        fact1.properties = { id: 14, campaign: 1, influencer: 44, retweets: 43, date: "2013-10-10", status: "activated"}
        fact1.save!
        fact2 = Fact.new()
        fact2.line_id = line.id
        fact2.properties = { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10", status: "created"}
        fact2.save!
        fact3 = Fact.new()
        fact3.line_id = line.id
        fact3.properties = { id: 673, campaign: 4, influencer: 32, retweets: 17, date: "2013-10-20", status: "activated"}
        fact3.save!
        fact4 = Fact.new()
        fact4.line_id = line.id
        fact4.properties = { id: 49, campaign: 1, influencer: 17, retweets: 22, date: "2013-10-20", status: "created"}
        fact4.save!
        fact5 = Fact.new()
        fact5.line_id = line.id
        fact5.properties = { id: 545, campaign: 1, influencer: 44, retweets: 36, date: "2013-10-30", status: "activated"}
        fact5.save!

        visit new_user_session_path

        within("#new_user") do
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Log in"
        end

        visit 'reports/tweet/?filters=campaign:7,influencer:44&aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer'
        within '#table_report' do
          expect(page).to have_content('No se encontraron resultados con los filtros actuales')
        end
      end
    end
  end
end
