require 'rails_helper'

RSpec.describe 'Ticket Master API' do
  before :each do
    @user = User.create!(display_name: 'ranger', email:'email@gmail.com' )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit lovers_path
  end

  describe 'Weather Form' do
    it "has fields for weather by location"  do

      expect(page).to have_content("Weather?")
      expect(page).to have_field(:q)
      expect(page).to have_button("Find")
    end
    it 'when i fill out the form, i am redirected to Weather shown path', :vcr do

      within ".weather" do
        fill_in :q, with: "Denver"
        click_button("Find")
      end
      expect(current_path).to eq(weather_path)
    end
  end
end
