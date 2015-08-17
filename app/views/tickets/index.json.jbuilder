json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :body, :level, :user_id
  json.url ticket_url(ticket, format: :json)
end
