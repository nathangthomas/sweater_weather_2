require "rails_helper"

describe Gif do
  it "exists" do
    WebMock.allow_net_connect!
    summary = 'Mostly cloudy throughout the day'
    time = 1572987600

    service = GiphyService.new
    gif_data = service.gif_by(summary)
    parsed_gif_data = JSON.parse(gif_data.body, symbolize_names: true)

    gif = Gif.new(parsed_gif_data, summary, time)

    expect(gif).to be_a Gif
    expect(gif.url).to eq("https://giphy.com/gifs/dark-castle-63xBFHKNVjZlu")
    expect(gif.summary).to eq("Mostly cloudy throughout the day")
  end
end
