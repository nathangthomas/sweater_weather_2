require 'rails_helper'

describe DarkSkyService do
  context "instance methods" do
    context "current weather forecast location (coordinates)" do
      it "returns current weather forecast" do
        # WebMock.allow_net_connect!
        response = File.read("./fixtures/location_data.json")
        data = JSON.parse(response, symbolize_names: true)

        location = Location.new(data)

        forecast_info = subject.current_forecast_by(location)
        expect(forecast_info).to be_a Hash

        expect(forecast_info[:currently][:summary]).to eq("Clear")
        expect(forecast_info[:hourly][:summary]).to eq("Partly cloudy throughout the day.")
        expect(forecast_info[:daily][:summary]).to eq("No precipitation throughout the week.")
      end
    end
  end
end
