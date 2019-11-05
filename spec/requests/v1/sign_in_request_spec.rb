require "rails_helper"

describe "User can sign into an account" do
  before{allow(SecureRandom).to receive(:urlsafe_base64).and_return("Th15at0Tal1y-RAn20mk3Y")}
  # allow(instance).to receive(:method).and_return(value)

  #most likely will need to create a user for this test.

  it "returns an api_key" do

  post "/api/v1/sessions?email=whatever@exeample.com&password=password"

    expect(response).to be_successful
    parsed_data = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_data[:data].count).to eq(3)
    expect(parsed_data[:data][:attributes][:api_key]).to eq("Th15at0Tal1y-RAn20mk3Y")
  end

  #sad path test here
end
