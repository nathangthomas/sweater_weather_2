class DarkSkyService
  def forecast_by(location)
    get_json("/forecast/#{ENV['DARK_SKY_API_KEY']}/#{location.coordinates}")
  end
  #   get_json("/forecast/#{ENV['DARK_SKY_API_KEY']}/#{location.coordinates}?exclude=minutely,alerts,flags")
  # end

  private

  def conn
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
