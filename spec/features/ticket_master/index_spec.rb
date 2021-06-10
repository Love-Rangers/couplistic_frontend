require 'rails_helper'

RSpec.describe 'Ticket Master API' do
  before :each do
    @user = User.create!(display_name: 'ranger', email:'email@gmail.com' )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit lovers_path
  end

  describe 'Search form' do
    it 'Search redirects to TM index with results', :vcr do

      fill_in :city, with: "Morrsion"
      fill_in :keyword, with: "Kygo"
      click_button("Search")

      expect(current_path).to eq(ticketmaster_path)
      expect(page).to have_content("Date Ideas")
      expect(page).to have_content("Venue: Red Rocks Amphitheatre")
      expect(page).to have_content("Kygo")
    end

    it 'One Search field redirects to TM index with results', :vcr do

      fill_in :keyword, with: "Broncos"
      click_button("Search")


      expect(current_path).to eq(ticketmaster_path)
      expect(page).to have_content("Dallas Cowboys vs. Denver Broncos")
      expect(page).to have_content("Pittsburgh Steelers vs. Denver Broncos")
      expect(page).to have_content("Jacksonville Jaguars vs. Denver Broncos")
    end

    it 'No field redirects to random  results', :vcr do

      click_button("Search")

      expect(current_path).to eq(ticketmaster_path)
      expect(page).to have_content("Eagles")
      expect(page).to have_content("West Conf Semis: Denver Nuggets at Phoenix Suns RD 2 GM 2")
    end


    it 'No field doesnt match any results redirects to dashboard' do
      fill_in :city, with: "Buena Vista"
      click_button("Search")

      expect(current_path).to eq(lovers_path)
      expect(page).to have_content("No Results match your service. Please try again.")
    end
  end
end
