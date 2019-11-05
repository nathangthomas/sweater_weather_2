require "rails_helper"

describe 'Giphy API' do
  it "returns custom gif for every hour of a locations daily forcast" do
    # WebMock.allow_net_connect!

    get "/api/v1/gifs?location=denver,co"

    expect(response).to be_successful
    gif_data = JSON.parse(response.body, symbolize_names: true)
    expect(gif_data[:data][0][:attributes].keys).to eq([:time, :summary, :url])
  end
end
