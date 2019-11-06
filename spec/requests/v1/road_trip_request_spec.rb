require "rails_helper"

describe 'Road Trip' do
  before :each do
    @user = User.create!(
      email: "sampleuser@email.com",
      password: "password"
    )
  end

  it "returns forecast for the hour of arrival" do
    WebMock.allow_net_connect!

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{@user.api_key}"
    }

    post '/api/v1/road_trip', params: body.as_json

    expect(response).to be_successful
    road_trip_data = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip_data[:data][:attributes].keys).to eq([:travel_time, :forecast_upon_arrival])
  end

  it "errors out due to invalid api key and does not return data" do

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "wrongApiKey"
    }

    post "/api/v1/road_trip", params: body

    expect(response).to_not be_successful
    road_trip = JSON.parse(response.body)

    expect(road_trip["error"]).to eq("Your API key is invalid.")
  end
end
