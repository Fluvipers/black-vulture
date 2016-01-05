require 'report_filters'

class ReportsController < ApplicationController

  def index
    @data = Fact.all
  end

  def total_retweets
    find_filters
    @data = ReportFilters.total_retweets(find_line, find_aggregate, find_filters)
  end

private

  def find_line
    line_id = (Line.find_by name: params[:fact]).id
    line_id.to_i
  end

  def find_aggregate
    options = params[:aggregate] ? params[:aggregate].split(/,/): []
    aggregate_params = Hash[options.map {|option| option.split ':'}]
  end

  def find_filters
    filters = params[:filters] ? params[:filters].split(/,/): []
    filter_params = Hash[filters.map {|filter| filter.split ':'}]
  end
end
