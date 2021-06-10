class CouplisticService
  def self.find_events_by_user_id(user_id)
    conn = Faraday.new("https://couplistic-be.herokuapp.com/")

    response = conn.get(
      "/api/v1/events?user_id=#{user_id}"
    )

    if response.body.empty?
      return Array.new
    else
      body = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
