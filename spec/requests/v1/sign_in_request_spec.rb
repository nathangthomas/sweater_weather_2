require "rails_helper"

describe "User can sign into an account" do
  before{allow(SecureRandom).to receive(:urlsafe_base64).and_return("O-F3evweAYU1HlhgrGnXiA")}

  it "returns an api_key" do

  User.create!(email: 'nola@email.com', password: 'jazZhandz')
  # allow(User).to receive(:find_by).and_return(@user)
  body = {
    "email": "nola@email.com",
    "password": "jazZhandz"}

  post "/api/v1/sessions", params: body.as_json

    expect(response).to be_successful
    parsed_data = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_data[:data].count).to eq(3)
    expect(parsed_data[:data][:attributes][:api_key]).to eq("O-F3evweAYU1HlhgrGnXiA")
  end

  #sad path test here
end
