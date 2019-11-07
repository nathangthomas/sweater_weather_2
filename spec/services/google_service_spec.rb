require 'rails_helper'

describe GoogleService do
  context "instance methods" do
    it "returns coordinates by city and state" do
      # stub_api_calls
      # WebMock.allow_net_connect!
      location_info = subject.location_by_city('denver,co')
      expect(location_info).to be_a Hash
      results = location_info[:results]
      expect(results).to be_an Array
      expect(results.count).to eq(1)

      expect(results[0][:formatted_address]).to eq("Denver, CO, USA")
      expect(results[0][:geometry][:location][:lat]).to eq(39.7392358)
      expect(results[0][:geometry][:location][:lng]).to eq(-104.990251)
    end

    it "returns length of time it takes to travel between two locations" do
      directions_info = subject.time_to_travel_between('Denver,CO', 'Pueblo,CO')
      expect(directions_info).to be_a Hash
      expect(directions_info[:routes][0][:legs][0][:duration].keys).to eq([:text, :value])
    end
  end
end
