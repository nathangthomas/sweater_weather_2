require 'rails_helper'

describe Location do
  it "exists" do
    location_data = File.read("./fixtures/location_data.json")
    parsed_location_data = JSON.parse(location_data, symbolize_names: true)

    location = Location.new(parsed_location_data)

    expect(location).to be_a Location
    expect(location.name).to eq("Denver, CO, USA")
    expect(location.lat).to eq(39.7392358)
    expect(location.lng).to eq(-104.990251)
    expect(location.coordinates).to eq("39.7392358,-104.990251")
    expect(location.city).to eq("Denver")
    expect(location.state).to eq("CO")
    expect(location.country).to eq("United States")
  end
end
