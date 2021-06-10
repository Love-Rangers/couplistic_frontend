class CouplisticFacade
  def self.get_events(user_id)
    body = CouplisticService.find_events_by_user_id(user_id)
    if body.empty?
      return Array.new
    else
      @events = body[:data].map { |e| Event.new(e)  }
    end
  end

  def self.get_weather_windows(city)
    conn = Faraday.new("https://couplistic-be.herokuapp.com/")

    response = conn.get("/api/v1/weather?q=#{city}")
    body = JSON.parse(response.body, symbolize_names: true)
require 'pry'; binding.pry
    Weather.new(body)
  end
end
