class InterestsController < ApplicationController
  def index show
    @interests = DashboardFacade.starred_Events(current_user.id)
    @excursions = DashboardFacade.user_excursions(current_user.id)
  end
end
