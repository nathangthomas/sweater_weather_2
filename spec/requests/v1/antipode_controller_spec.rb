require "rails_helper"

describe 'Antipode API' do
  it "returns data for a locaiton opposite the globe from the input city" do
    WebMock.allow_net_connect!

    get "/api/v1/antipode?location=HongKong"
    expect(response).to be_successful
    location_data = JSON.parse(response.body, symbolize_names: true)
    expect(location_data[:data].count).to eq(1)
    location_data[:data][:attributes][:location_name] = "Jujuy,Argentina"
    location_data[:data][:attributes][:forecast] = "39.7392358,-104.990251"
    location_data[:data][:search_location] = "HongKong"
  end
end
