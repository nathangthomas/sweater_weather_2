require 'rails_helper'

describe GoogleService do
  context "instance methods" do
    context "coordinates by city and state" do
      it "returns coordinates" do
        # WebMock.allow_net_connect!
         # stub_geocoding_api_calls
        location_info = subject.location_by_city('denver,co')
        expect(location_info).to be_a Hash
        results = location_info[:results]
        expect(results).to be_an Array
        expect(results.count).to eq(1)

        expect(results[0][:formatted_address]).to eq("Denver, CO, USA")
        expect(results[0][:geometry][:location][:lat]).to eq(39.7392358)
        expect(results[0][:geometry][:location][:lng]).to eq(-104.990251)
      end
    end
  end
end
