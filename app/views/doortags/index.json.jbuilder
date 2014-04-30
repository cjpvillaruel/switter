json.array!(@doortags) do |doortag|
  json.extract! doortag, :id, :tag, :string, :swit_id
  json.url doortag_url(doortag, format: :json)
end
