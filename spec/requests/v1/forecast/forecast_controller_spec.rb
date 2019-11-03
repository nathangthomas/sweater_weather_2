require "rails_helper"

describe 'Dark Ski API' do
  it "gets current forecast data" do

  get "/api/v1/forecast?location=denver,co"


  expect(response).to be_successful
  forecast_data = JSON.parse(response.body, symbolize_names: true)
  expect(forecast_data[:data][:attributes].keys).to eq([:currently, :today, :hourly, :daily, :current_time, :current_date, :timezone, :coordinates])
  end
end
