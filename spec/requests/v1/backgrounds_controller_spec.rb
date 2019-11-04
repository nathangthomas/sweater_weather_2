require "rails_helper"

describe 'Flickr API' do
  it "returns custom background image for specific city" do
    WebMock.allow_net_connect!

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    image_data = JSON.parse(response.body, symbolize_names: true)
    expect(image_data[:data].keys).to eq([:id, :type, :attributes])
    expect(image_data[:data][:attributes].keys).to eq([:flickr_url])
  end
end
