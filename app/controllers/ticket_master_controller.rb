class TicketMasterController < ApplicationController
  def index
    @events = if params[:city] && params[:keyword]
              TicketMasterFacade.get_tickets(params[:city], params[:keyword])
            elsif params[:city] || params[:keyword]
               TicketMasterFacade.get_tickets(params[:city], params[:keyword])
             else params[:city].blank? && params[:keyword].blank?
               TicketMasterFacade.get_tickets(params[:city], params[:keyword])
             end
   return unless @events.nil?
   flash[:notice] = "No Results match your service. Please try again."
   redirect_to lovers_path
  end
end 
  # def index
  #   city = params[:city]
  #   keyword = params[:keyword]
  #
  #   @events = TicketMasterFacade.get_tickets(city, keyword)
  # end
# end
