require 'rails_helper'

feature "Show Dashboard" do
  before do
    @user = FactoryGirl.create(:user)
    @line = FactoryGirl.create(:line, :tweet_line) 
    @fact1 = Fact.create!(line_id: @line.id, properties: { id: 14, campaign: 1, influencer: 44, retweets: 43, date: "2013-10-10",
                           status: "activated"})

    @fact2 = Fact.create!(line_id: @line.id, properties: { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10",
                           status: "created"} )

    @fact3 = Fact.create!(line_id: @line.id, properties: { id: 44, campaign: 2, influencer: 44, retweets: 26, date: "2013-10-10",
                           status: "created"} )

    @fact4 = Fact.create!(line_id: @line.id, properties: { id: 673, campaign: 4, influencer: 32, retweets: 17, date: "2013-10-20",
                           status: "activated"})

    @fact5 = Fact.create!(line_id: @line.id, properties: { id: 49, campaign: 1, influencer: 17, retweets: 22, date: "2013-10-20",
                           status: "created"})

    @fact6 = Fact.create!(line_id: @line.id, properties: { id: 545, campaign: 1, influencer: 44, retweets: 36, date: "2013-10-30",
                           status: "activated"})
    @dashboard = @line.dashboards.create!(name:'Mi primer dashboard')

    visit new_user_session_path

    within("#new_user") do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_button "Log in"
    end
  end



  context "Exists a tweet line" do
    context "and it has a dashboard associated" do
      context "and this dashboard has associated sections" do
        scenario "should show all the sections" do
          section1 = @dashboard.sections.create!(name:'Seccion 1', query: "aggregate=sum:retweets,group:campaign-influencer")
          section2 = @dashboard.sections.create!(name:'Seccion 2', query:'filters=campaign:1,influencer:44&aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer')
          section3 = @dashboard.sections.create!(name:'Seccion 3', query:'filters=campaign:1,influencer:32&aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer')

          visit "/dashboard/#{@dashboard.id}"

          expect(page).to have_content("Mi primer dashboard")
          expect(page).to have_content("Seccion 1")
          expect(page).to have_content("Seccion 2")
          expect(page).to have_content("Seccion 3")

          within("#Seccion_1") do
            expect(page).to have_xpath(".//tr", :count => 4)
            expect(page).to have_xpath(".//th", :count => 3)
            expect(page).to have_content("total")
            expect(page).not_to have_content("count")
          end

          within("#Seccion_2") do
            expect(page).to have_xpath(".//tr", :count => 1)
            expect(page).to have_xpath(".//th", :count => 5)
            expect(page).to have_content("total")
            expect(page).to have_content("count")
            expect(page).to have_content("promedio")
          end

          within("#Seccion_3") do
            expect(page).to have_xpath(".//tr", :count => 0)
            expect(page).to have_xpath(".//th", :count => 0)
            expect(page).to have_content("No se encontraron resultados con los filtros actuales")
          end
        end
      end
      context "and this dashboard has no associated sections" do
        scenario "should show only dashboard name" do
          visit "/dashboard/#{@dashboard.id}"

          expect(page).to have_content("Mi primer dashboard")
        end
      end
    end
  end
end
