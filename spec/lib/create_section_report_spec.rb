require "rails_helper"
require "create_section_report"
describe CreateSectionReport  do
  context "when a query is passed" do
    it "#find_filters should return a hash with the aggregate functions" do
      query = "filters=campaign:1,influencer:44&aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer"
      result = CreateSectionReport.new(1,query).find_filters
      expect(result).to eq ({"campaign"=>"1", "influencer"=>"44"})
    end
    it "#find_aggregate should return a hash with the aggregate functions" do
      query = "filters=campaign:1,influencer:44&aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer"
      result = CreateSectionReport.new(1,query).find_aggregate
      expect(result).to eq ({"sum"=>"retweets", "count"=>"retweets", "avg"=>"retweets", "group"=>"campaign-influencer"})
    end
    it "#find_aggregate should return an empty hash if no aggregate functions are specified" do
      query = "filters=campaign:1,influencer:44"
      result = CreateSectionReport.new(1,query).find_aggregate
      expect(result).to eq ({})
    end
    it "#find_filters should return an empty hash if no filters are specified " do
      query = "aggregate=sum:retweets,count:retweets,avg:retweets,group:campaign-influencer"
      result = CreateSectionReport.new(1,query).find_filters
      expect(result).to eq ({})
    end
  end
end
