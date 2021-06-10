class TicketMasterController < ApplicationController
  def index
    city = params[:city]
    keyword = params[:keyword]

    @events = TicketMasterFacade.get_tickets(city, keyword)
  end
end
