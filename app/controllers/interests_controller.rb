class InterestsController < ApplicationController
  def index show
    @interests = DashboardFacade.starred_interest(current_user.id)
    @events = DashboardFacade.user_events(current_user.id)
  end
end
