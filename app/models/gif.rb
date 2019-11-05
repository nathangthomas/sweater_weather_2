class Gif
  attr_reader :id, :time, :summary, :url

  def initialize(gif_data)
    @id = rand(0..999)
    @gif_data = gif_data
    @url = giphy_url
    # @time =
    # @summary =
  end

  def giphy_url
    @gif_data[:data][0][:url]
  end
end
