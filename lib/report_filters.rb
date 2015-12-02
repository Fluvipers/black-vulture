class ReportFilters
  
  def self.total_retweets
    query = "SELECT line_id, sum(cast(properties::json->>'retweets' as integer)) FROM FACTS where line_id=1 and key='retweets' group by line_id;"
    line = ActiveRecord::Base.connection.execute(query).values.first[1].to_i
    line
  end

end
