json.array!(@swits) do |swit|
  json.extract! swit, :id, :post
  json.url swit_url(swit, format: :json)
end
