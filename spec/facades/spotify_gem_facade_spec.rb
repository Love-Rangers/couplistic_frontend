require 'rails_helper'

RSpec.describe SpotifyGemFacade, type: :facade do
  it "returns 3 song recommendations", :vcr do
    expect(SpotifyGemFacade.get_recommendations.size).to eq(3)
  end
end
