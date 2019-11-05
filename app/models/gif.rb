class Gif
  attr_reader :id, :time, :summary, :url

  def initialize(parsed_data, summary, time)
    @id = rand(0..999)
    @gif_data = parsed_data
    @url = giphy_url
    @time = time
    @summary = summary
  end

  def giphy_url
    @gif_data[:data][0][:url]
  end
end
