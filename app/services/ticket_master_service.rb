class TicketMasterService
  class << self
    def get_ticket_info(city, keyword)
      response = conn.get("/api/v1/ticketmaster?city=#{city}&keyword=#{keyword}")
        parse_data(response)[:data]
    end

    private

    def conn
      Faraday.new(url: 'https://couplistic-be.herokuapp.com')
    end

    def parse_data(response)
      if response.body.empty?
        return Hash.new
      else
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
