json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :body
  json.url feedback_url(feedback, format: :json)
end
