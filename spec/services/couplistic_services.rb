require 'rails_helper'

RSpec.describe 'Couplistic service' do
  it 'can return a events by user' do
      user = create(:user)
      stub_request(:post, "https://couplistic-be.herokuapp.com/api/v1/events?user_id=#{user_id}").to_return(status: 201)


    json = CouplisticService.find_events_by_user_id(user_id)

    expect(json).to be_an(Array)

    expect(json[0]).to have_key :name
    expect(json[0][:name]).to be_a(String)

    expect(json[0]).to have_key :url
    expect(json[0][:url]).to be_a(String)

    expect(json[0]).to have_key :images
    expect(json[0][:images]).to be_an(Array)

    expect(json[0][:images][0]).to have_key :url
    expect(json[0][:images][0][:url]).to be_a(String)

    expect(json[0]).to have_key :sales
    expect(json[0][:sales]).to have_key :public

    expect(json[0][:sales][:public]).to have_key :startDateTime
    expect(json[0][:sales][:public][:startDateTime]).to be_a(String)


    expect(json[0]).to have_key :_embedded
    expect(json[0][:_embedded]).to have_key :venues
    expect(json[0][:_embedded][:venues]).to be_an(Array)
    expect(json[0][:_embedded][:venues][0]).to have_key :name
    expect(json[0][:_embedded][:venues][0][:name]).to be_a(String)

    expect(json[0]).to have_key :id
    expect(json[0][:id]).to be_a(String)
  end
end
