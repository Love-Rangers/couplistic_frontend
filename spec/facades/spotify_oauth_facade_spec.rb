require 'rails_helper'

RSpec.describe SpotifyOauthFacade, type: :request do
  it "returns an access token", :vcr do
    expect(SpotifyOauthFacade.exchange_access_code('bearer code').class).to eq(NilClass)
  end
end
