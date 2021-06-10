class CouplisticService
  def self.find_events_by_user_id(user_id)
    conn = Faraday.new('http://localhost:3001')

    response = conn.get(
      "/api/v1/events?user_id=#{user_id}"
    )
    body = JSON.parse(response.body, symbolize_names: true)
end
end
