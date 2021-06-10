class Ticket
  attr_reader :name,
              :url,
              :poster,
              :start_time,
              :venue
  def initialize(ticket_info)
    @name       = ticket_info[:event_name]
    @url        = ticket_info[:url]
    @poster     = ticket_info[:poster]
    @start_time = format_start_time(ticket_info[:start_time])
    @venue      = ticket_info[:venue]
  end

  def format_start_time(time_unformatted)
    DateTime.strptime(time_unformatted)
    .strftime("%m/%d/%Y at %I:%M%p")
  end
end
