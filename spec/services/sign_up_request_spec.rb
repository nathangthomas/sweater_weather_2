require "rails_helper"

describe "User can sign up for an account" do
  it "returns an api_key" do
    allow(SecureRandom)
      .to receive(:urlsafe_base64)
      .and_return("Th15at0Tal1y-RAn20mk3Y")

    post "/api/v1/users?email=whatever@exeample.com&password=password&password_confirmation=password"

    expect(response).to be_successful
    api_key = JSON.parse(response.body)

  end
end
