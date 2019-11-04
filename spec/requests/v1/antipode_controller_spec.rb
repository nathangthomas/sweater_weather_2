require "rails_helper"

describe 'Antipode API' do
  it "returns a lat and lng opposite the globe from the original" do
    WebMock.allow_net_connect!

    get "/api/v1/antipode?location=<start_location_city_name>"

    expect(response).to be_successful
    # location_data = JSON.parse(response.body, symbolize_names: true)
    # expect(location_data.count).to eq(1)
    # location_data[:data][:attributes][:name] = "Denver, CO, USA"
    # location_data[:data][:attributes][:coordinates] = "39.7392358,-104.990251"
    # location_data[:data][:attributes][:coordinates] = "39.7392358,-104.990251"
  end
end
