class WeatherService
  class << self
    def get_three_day_forecast(location)
      response = conn.get("/api/v1/weather?q=#{location}")
        parse_data(response)[:data][:attributes]
    end

    private

    def conn
      Faraday.new(url: 'https://couplistic-be.herokuapp.com')
    end

    def parse_data(response)
      if response.body.empty?
        return Array.new
      else
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
