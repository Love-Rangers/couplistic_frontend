require "rails_helper"


describe 'CouplisticFacade' do
  it 'exists', :vcr do
    couplistic_facade = CouplisticFacade.new
    expect(couplistic_facade).to be_an_instance_of(CouplisticFacade)
  end

  it 'returns all user events', :vcr do
     couplistic_facade = CouplisticFacade.get_events(1)
     expect(couplistic_facade.count).to eq(11) 
     expect(couplistic_facade.first).to be_an_instance_of(Event)
  end

  it 'returns weather forcast', :vcr do
    couplistic_facade = CouplisticFacade.get_weather_windows("Denver")

    expect([couplistic_facade].count).to eq(1) 
    expect(couplistic_facade).to be_an_instance_of(Weather)
  end
end