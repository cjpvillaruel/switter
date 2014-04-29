json.array!(@sours) do |sour|
  json.extract! sour, :id, :user_id, :string, :swit_id
  json.url sour_url(sour, format: :json)
end
