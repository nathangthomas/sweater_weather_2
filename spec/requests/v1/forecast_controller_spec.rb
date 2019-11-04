require "rails_helper"

describe 'Dark Ski API' do
  it "gets current forecast data" do
    WebMock.allow_net_connect!

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    forecast_data = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_data[:data][:attributes].keys).to eq([:currently, :today, :tonight, :hourly, :daily, :timezone, :coordinates])

  end
end
