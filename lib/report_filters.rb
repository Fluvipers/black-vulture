class ReportFilters
  
  def self.total_retweets(line_id, agregate, filters)
    @agregate = agregate
    @filters = filters
    @line_id = line_id
    add_count_clause
  end

  def self.add_count_clause
    @query = @agregate["count"] ? "count(*)," : ""
    add_avg_clause
  end

  def self.add_avg_clause
    property = @agregate["avg"]
    @query += property ? "avg(cast(properties::json->>'#{property}' as integer)) as Promedio," : @query
    add_sum_clause
  end

  def self.add_sum_clause
    property = @agregate["sum"]
    if property
      @query += "sum(cast(properties::json->>'#{property}' as integer)) as Total FROM FACTS where line_id=#{@line_id} "
    else
      @query[-1] = " FROM FACTS where line_id=#{@line_id}"
    end
    add_filters
  end

  def self.add_filters
    @filters.each do |key, value|
      @query += "and properties::json->>'#{key}'='#{value}' "
    end
    add_group_clause
  end

  def self.add_group_clause
    properties = @agregate["group"].split(/-/)
    @query = "SELECT " + @query + "GROUP BY "

    properties.each do |property|
      @query.insert 7, "properties::json->>'#{property}' as #{property},"
      @query.insert -1, "properties::json->>'#{property}',"
    end

    @query[-1] = ";"
    execute_query
  end

  def self.execute_query
    result = ActiveRecord::Base.connection.execute(@query).entries
    report = result.empty? ? 'No se encontraron resultados con los filtros actuales' : result
  end
end
