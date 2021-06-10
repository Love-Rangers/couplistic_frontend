class TicketMasterFacade
  class << self
    def get_tickets(location, keyword)
      create_tickets(TicketMasterService.get_ticket_info(location, keyword))
    end

    private

    def create_tickets(ticket_info)
      ticket_info.map do |ticket|
        Ticket.new(ticket[:attributes])
      end
    end
  end
end
