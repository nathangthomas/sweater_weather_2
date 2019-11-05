require "rails_helper"

describe Gif do
  it "exists" do
    WebMock.allow_net_connect!

    service = GiphyService.new
    gif_data = service.gif_by('Mostly cloudy throughout the day')
    parsed_gif_data = JSON.parse(gif_data.body, symbolize_names: true)
    gif = Gif.new(parsed_gif_data)

    expect(gif).to be_a Gif
    expect(gif.url).to eq("https://giphy.com/gifs/dark-castle-63xBFHKNVjZlu")
    expect(gif.summary).to eq("Mostly cloudy throughout the day")
  end
end
