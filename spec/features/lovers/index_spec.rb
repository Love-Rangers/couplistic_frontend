require 'rails_helper'

describe 'As an authenticated user when I visit the  dashboard' do
  before :each do
    @user = User.create!(display_name: 'ranger', email:'email@gmail.com' )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end

  it "I see a welcome message with my email" do
    visit lovers_path

    expect(page).to have_content("Hi <%= @user.display_name %>!")
  end

  describe 'Ticket Master Form' do
    it "shows a search form for events by the keyboard or city" do
      visit lovers_path

      expect(page).to have_content("Tickets?")
      expect(page).to have_field(:city)
      expect(page).to have_field(:keyword)
      expect(page).to have_button("Search")
    end

    it "when i fill out the form, i am redirected to TM path" do
      visit lovers_path

      fill_in :city, with: "Morrsion"
      fill_in :keyword, with: "Reggae"

      click_button("Find")
      expect(current_path).to eq(ticketmaster_path)
    end
  end


  describe 'Weather Form' do
    it "can search for weather by location" do
      visit lovers_path

      expect(page).to have_content("Weather?")
      expect(page).to have_field(:q)

      click_button("Find")

      expect(current_path).to eq('dashboard/index')
    end
  end
end
