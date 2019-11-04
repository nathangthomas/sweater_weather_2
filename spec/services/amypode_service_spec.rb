require 'rails_helper'

describe AmypodeService do
  context "instance methods" do
    context "antipode(coordinates)" do
      it "returns a city's antipode coordinates" do

        WebMock.allow_net_connect!

        location_info = LocationsFacade.new('hong kong').location

        antipode_info = subject.antipode_by(location_info)

        expect(antipode_info).to be_a Hash

        expect(antipode_info[:data].keys).to eq([:id, :type, :attributes])
        expect(antipode_info[:data][:attributes].keys).to eq([:lat, :long])
      end
    end
  end
end
