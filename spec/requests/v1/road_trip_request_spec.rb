require "rails_helper"

describe 'Road Trip' do
  it "returns forecast for the hour of arrival" do
    WebMock.allow_net_connect!

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    post '/api/v1/road_trip', params: body.as_json

    expect(response).to be_successful
    image_data = JSON.parse(response.body, symbolize_names: true)

    #come back and fill in tests

  end
end
