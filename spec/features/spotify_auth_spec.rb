require 'rails_helper'

RSpec.describe "Spotify OAuth2 process" do
  it "happy path: allows user to login" do
    visit root_url

    click_on "Login with Spotify"
  end
end
