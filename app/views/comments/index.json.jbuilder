json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :user_id, :swit_id
  json.url comment_url(comment, format: :json)
end
