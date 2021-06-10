class CouplisticFacade
  def self.get_events(user_id)
    body = CouplisticService.find_events_by_user_id_db(user_id)
    if body.empty?
      return Array.new
    else
      @events = body[:data].map { |e| Event.new(e)  }
    end
  end

  def self.get_weather_windows(city)
    body = CouplisticService.get_weather_windows_db(city)
    Weather.new(body)
  end
end
