require "rails_helper"

describe 'Google Geocode API' do
  it "gets location data" do
    WebMock.allow_net_connect!

    get '/api/v1/location?location=denver,co'

    expect(response).to be_successful
    location_data = JSON.parse(response.body, symbolize_names: true)
    expect(location_data.count).to eq(1)
    location_data[:data][:attributes][:name] = "Denver, CO, USA"
    location_data[:data][:attributes][:coordinates] = "39.7392358,-104.990251"
    location_data[:data][:attributes][:coordinates] = "39.7392358,-104.990251"
  end
end
