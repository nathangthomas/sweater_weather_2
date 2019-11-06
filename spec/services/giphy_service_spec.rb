require "rails_helper"

describe GiphyService do
  context 'instance methods' do
    it "returns a gif associated with a city" do
      stub_api_calls
      # WebMock.allow_net_connect!

      gif_data = subject.gif_by('Mostly cloudy throughout the day')
      gif = JSON.parse(gif_data.body, symbolize_names: true)

      expect(gif).to be_an Hash
      expect(gif[:data][0][:url]).to eq("https://giphy.com/gifs/dark-castle-63xBFHKNVjZlu")
    end
  end
end
