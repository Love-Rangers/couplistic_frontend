class TicketmasterController < ApplicationController
  def index
    city = params[:city]
    keyword = params[:keyword]

    response = Faraday.get("https://couplistic-be.herokuapp.com/api/v1/ticketmaster?city=#{city}&keyword=#{keyword}")

    json = JSON.parse(response.body, symbolize_names: true)

    @events = json[:data]
    # redirect_to ticketmaster_path
  end
end
