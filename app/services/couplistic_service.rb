class CouplisticService
  def self.find_events_by_user_id_db(user_id)
    response = conn.get(
      "/api/v1/events?user_id=#{user_id}"
    )

    if response.body.empty?
      return Array.new
    else
      json_parse(response)
    end
  end

  def self.get_weather_windows_db(city)
    response = conn.get(
      "/api/v1/weather?q=#{city}"
    )
    
    json_parse(response)
  end

  private

  def self.conn
    Faraday.new("https://couplistic-be.herokuapp.com/")
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
