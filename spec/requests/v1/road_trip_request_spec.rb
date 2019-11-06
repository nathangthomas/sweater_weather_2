require "rails_helper"

describe 'Road Trip' do
  it "returns forecast for the hour of arrival" do
    WebMock.allow_net_connect!

    user = User.create!(
      email: "sampleuser@email.com",
      password: "password"
    )

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }

    post '/api/v1/road_trip', params: body.as_json

    expect(response).to be_successful
    road_trip_data = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip_data[:data][:attributes].keys).to eq([:travel_time, :forecast_upon_arrival])
  end
end
