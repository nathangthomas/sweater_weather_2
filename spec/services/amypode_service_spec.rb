require 'rails_helper'

describe AmypodeService do
  context "instance methods" do
    context "antipode(coordinates)" do
      it "returns a city's antipode coordinates" do
        # stub_api_calls
        WebMock.allow_net_connect!
        # response = File.read("./fixtures/amypode_data_hongkong.json")
        data = subject.parsed_data
        location = Antipode.new(data)
        binding.pry

        forecast_info = subject.forecast_by(location)
        expect(forecast_info).to be_a Hash

        # expect(forecast_info[:currently][:summary]).to eq("Clear")
        expect(forecast_info[:currently][:summary]).to eq("Partly Cloudy")
        expect(forecast_info[:hourly][:summary]).to eq("Partly cloudy throughout the day.")
        expect(forecast_info[:daily][:summary]).to eq("No precipitation throughout the week.")
      end
    end
  end
end
