require "rails_helper"

describe 'Google Geocode API' do
  it "gets location data" do

    get '/api/v1/location?location=denver,co'

    expect(response).to be_successful
    location_data = JSON.parse(response.body)

    # expect(location_data).count to_eq(1)
  end
end
