class CouplisticFacade
  def self.get_events(user_id)
    body = CouplisticService.find_events_by_user_id(user_id)
    @events = body[:data].map { |e| Event.new(e)  }
  end
end
