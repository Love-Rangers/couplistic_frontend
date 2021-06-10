require 'rails_helper'

RSpec.describe 'Ticket Master API' do
  describe 'Search Results' do
    it "Lists search results" do
      visit 'ticketmaster_path'
    end
  end
end
