require 'rails_helper'

describe AmypodeService do
  context "instance methods" do
    context "antipode(coordinates)" do
      it "returns a city's antipode coordinates" do
        # stub_api_calls
        WebMock.allow_net_connect!
        # response = File.read("./fixtures/amypode_data_hongkong.json")
        location_info = LocationsFacade.new('hong kong').location

        antipode_info = subject.antipode_by(location_info)
        # data = subject.parsed_data
        # location = .new(data)

        expect(antipode_info).to be_a Hash

        # expect(forecast_info[:currently][:summary]).to eq("Clear")
        expect(anipode_info[:data]).to
      end
    end
  end
end
