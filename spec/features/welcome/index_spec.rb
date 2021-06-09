require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'When I visit the Root path' do
    it 'displays app name and spotify rule direct' do
      visit root_path
      expect(page).to have_content('Couplistic')
      find(:css, 'img[src*="connectwithspotify"]')
    end
  end

  describe 'sad path - invalid credentials ' do
    it 'has returns to root page if credentials are bad' do
      visit root_path

      find(:css, 'img[src*="connectwithspotify"]').click
      expect(page).to have_content('You must login with Spotify first')
      expect(current_path).to eq('/')
    end
  end

  describe 'happy path - valid credentials' do
    it 'redirects to dashboard' do
      user = User.create!(display_name: 'Lover-Ranger', email:'lover@gmail.com')

      visit root_path

      find(:css, 'img[src*="connectwithspotify"]').click
      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Welcome #{user.display_name}")
      # save_and_open_page
    end
  end
end
