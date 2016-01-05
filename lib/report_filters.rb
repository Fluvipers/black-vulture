class ReportFilters
  
  def self.total_retweets(line_id, agregate, filters)
    base_query = "SELECT line_id, "
    query_sum = add_sum_clause(agregate["sum"], base_query, line_id)
    query_filters = add_filters(filters, query_sum)
    query_group = add_group_clause(agregate["group"], query_filters)
    line = ActiveRecord::Base.connection.execute(query_group).values.first[1].to_i
  end

  def self.add_sum_clause(property, query, line_id)
    query += "sum(cast(properties::json->>'#{property}' as integer)) FROM FACTS where line_id=#{line_id} "
  end

  def self.add_group_clause(property, query)
    query += "group by #{property};"
  end

  def self.add_filters(filters, query)
    filters.each do |key, value|
      query += "and properties::json->>'#{key}'='#{value}' "
    end
    query
  end

end
