class GiphyService

  def gif_by(weather_summary)
    Faraday.get "https://api.giphy.com/v1/gifs/search?api_key=l1RMz2nBcSsGN8n7HhFAHAdviLXs6nvS&limit=1&q=#{weather_summary}"
  end

end
