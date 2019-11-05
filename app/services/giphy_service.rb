class GiphyService

  def gif_by(weather_summary)
    Faraday.get "https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&limit=1&q=#{weather_summary}"
  end

end
