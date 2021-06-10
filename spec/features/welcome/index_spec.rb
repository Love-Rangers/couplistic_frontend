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
      expect(current_path).to eq('/')
    end
  end

  describe 'happy path - valid credentials' do
    before :each do
      visit root_path

      @user = User.create!(display_name: 'ranger', email:'email@gmail.com' )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'redirects to dashboard', :vcr do
      visit lovers_path

      expect(page).to have_content(@user.display_name)
    end

    it 'after I am logged in, i can see and click on button to click out', :vcr do
      visit lovers_path

      click_link 'Logout'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out')
    end
  end
end
