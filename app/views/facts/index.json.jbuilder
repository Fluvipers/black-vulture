json.array!(@facts) do |fact|
  json.extract! fact, :id, :line_id, :properties
  json.url fact_url(fact, format: :json)
end
