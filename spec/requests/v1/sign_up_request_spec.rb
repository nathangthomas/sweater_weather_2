require "rails_helper"

describe "User can sign up for an account" do
  before{allow(SecureRandom).to receive(:urlsafe_base64).and_return("Th15at0Tal1y-RAn20mk3Y")}
  it "returns an api_key" do

    post "/api/v1/users?email=whatever@exeample.com&password=password&password_confirmation=password"

    expect(response).to be_successful
    parsed_data = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_data[:data].count).to eq(3)
    expect(parsed_data[:data][:attributes][:api_key]).to eq("Th15at0Tal1y-RAn20mk3Y")
  end

  #sad path test here
end
