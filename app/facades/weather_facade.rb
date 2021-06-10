class WeatherFacade
  class << self
    def get_weather_info(location)
      create_weather(WeatherService.get_three_day_forecast(location))
    end

    private

    def create_weather(weather_info)
      Weather.new(weather_info)
    end
  end
end
