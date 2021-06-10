require 'rails_helper'

describe 'As an authenticated user when I visit the  dashboard' do
  before :each do
    @user = User.create!(display_name: 'ranger', email:'email@gmail.com' )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "I see a welcome message with my email", :vcr do
    visit lovers_path

    expect(page).to have_content(@user.display_name)
  end

  describe 'Ticket Master Form', :vcr do
    it "shows a search form for events by the keyboard or city" do
      visit lovers_path

      expect(page).to have_content("Search Event Tickets")
      expect(page).to have_field(:city)
      expect(page).to have_field(:keyword)
      expect(page).to have_button("Search")
    end

    it "when i fill out the form, i am redirected to TM path", :vcr do
      visit lovers_path

      fill_in :city, with: "Morrison"
      fill_in :keyword, with: "Reggae"
      click_button("Search")

      expect(current_path).to eq(ticketmaster_path)
    end

    it "shows an empty page when no results", :vcr do
      visit lovers_path

      fill_in :city, with: "sdfjkgjgsdfgasf"

      click_button("Search")
      expect(current_path).to eq(ticketmaster_path)
    end
  end

  describe 'Weather Form' do
    it "can search for weather by location" do
      visit lovers_path

      expect(page).to have_content("Current Weather")
      expect(page).to have_field(:q)

      click_button("Is It Sunny?")
      expect(page).to have_content("Sorry, currently no weather 😞")

      fill_in :q, with: "Denver"
      click_button("Is It Sunny?")
      expect(current_path).to eq('/weather')
    end
  end
end
