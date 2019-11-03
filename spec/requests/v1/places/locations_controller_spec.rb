require "rails_helper"

describe 'Google Geocode API' do
  it "gets location data" do
    # json_response = File.open("./fixtures/location_data.json")

    # stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GOOGLE_API_KEY']}&address=denver,co").to_return(status: 200, body: json_response)

    get '/api/v1/places/denver,co'

    expect(response).to be_successful
    location_data = JSON.parse(response.body)
# binding.pry
    # expect(location_data).count to_eq(1)
  end
end
