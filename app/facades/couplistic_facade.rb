class CouplisticFacade
  def self.get_events(user_id)
    body = CouplisticService.find_events_by_user_id(user_id)
    @events = body[:data].map { |e| Event.new(e)  }
  end

  def self.get_weather_windows(city)
    conn = Faraday.new('http://localhost:3001')

    response = conn.get("/api/v1/weather?q=#{city}")
    body = JSON.parse(response.body, symbolize_names: true)
    
    Weather.new(body)
  end
end
