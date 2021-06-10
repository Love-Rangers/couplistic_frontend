class WeatherService
  class << self
    def get_three_day_forecast(location)
      response = conn.get("/api/v1/weather?q=#{location}")
      if response.body.empty? 
        Array.new
      else
        parse_data(response)[:data][:attributes]
      end
    end

    private

    def conn
      Faraday.new(url: 'https://couplistic-be.herokuapp.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
