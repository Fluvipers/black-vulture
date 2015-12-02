require 'report_filters'

class ReportsController < ApplicationController

  def index
    @data = Fact.all
  end

  def total_retweets
    @data = ReportFilters.total_retweets
    puts "@"  *100
    puts @data
  end
end
