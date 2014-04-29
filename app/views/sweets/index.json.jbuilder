json.array!(@sweets) do |sweet|
  json.extract! sweet, :id, :user_id, :swit_id
  json.url sweet_url(sweet, format: :json)
end
