json.array!(@lines) do |line|
  json.extract! line, :id, :name, :properties
  json.url line_url(line, format: :json)
end
