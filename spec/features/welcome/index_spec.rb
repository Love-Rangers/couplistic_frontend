require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'When I visit the Root Path' do
    it 'displays title and login button' do
      visit root_path
      expect(page).to have_content('Couplistic')
      expect(page).to have_button('Login through Google')
    end
  end

  describe 'sad path ' do
    xit 'has returns to home page if credentials are bad' do
      stub_omniauth_sad
      visit root_path

      click_button 'Login through Google'
      expect(page).to have_content('Invalid Credentials')
      expect(current_path).to eq(root_path)
    end
  end

  describe 'happy path' do
    it 'brings us to the correct page if google credentials are good' do
      user = User.create!(id:1, uid: '123545', username: 'Brisa Gonzalez', email:'turing@gmail.com')
      omniauth_response = stub_omniauth_happy('123545', 'Brisa Gonzalez', 'turing@gmail.com')
      user_1 = User.from_omniauth(omniauth_response)
      #
      # VCR.use_cassette('dashboard_index') do
        visit root_path
        # save_and_open_page

        click_button 'Login through Google'
        expect(current_path).to eq('/')
        expect(page).to have_content("Welcome #{user_1.username}")
      # end
    end
  end


  describe 'After I am logged in, there is a button to logout' do
    it 'logs user out' do
      user = User.create!(id:1, uid: '123545', username: 'Brisa Gonzalez', email:'Brisa turing@gmail.com')
      omniauth_response = stub_omniauth_happy('123545', 'Brisa Gonzalez', 'Brisa turing@gmail.com')
      user_1 = User.from_omniauth(omniauth_response)

        visit root_path

        # click_button 'Login through Google'
        click_button 'Logout'
        expect(page).to have_content("You have been logged out.")
        expect(current_path).to eq(root_path)
    end
  end
end
