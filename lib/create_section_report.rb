require 'report_filters'
class CreateSectionReport

  def initialize(line, query)
    @line =line
    @query = query 
  end

  def create_section_report
    ReportFilters.create_report(@line.id, find_aggregate, find_filters)
  end

  def split_query
    @query.split('&') 
  end

  def find_aggregate_string
    splitted_query = split_query
    query_aggregate = query_select(splitted_query, 'aggregate')
    clean_query( query_aggregate, "aggregate=") unless query_aggregate.blank?
  end

  def find_filters_string
    splitted_query = split_query
    query_filters = query_select(splitted_query, 'filters')
    clean_query(query_filters, "filters=") unless query_filters.blank?
  end

  def query_select(query, magic_word)
    query.select{ |part| part.start_with?(magic_word)}[0]
  end

  def clean_query(query, word)
    query.gsub(word, '').split(',')
  end

  def find_aggregate
    Hash[find_aggregate_string.map {|option| option.split ':'}]
  end

  def find_filters
    Hash[find_filters_string.map {|filter| filter.split ':'}]
  end
end
