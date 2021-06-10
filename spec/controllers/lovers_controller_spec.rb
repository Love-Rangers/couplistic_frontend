require 'rails_helper'

RSpec.describe LoversController do
  it "returns a current_user successfully" do
    get :index
    expect(response.status).to eq(200)
  end
end
