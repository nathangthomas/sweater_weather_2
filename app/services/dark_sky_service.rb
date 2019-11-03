class DarkSkyService

  def forecast_by(location)
    get_json("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{location.coordinates}?exclude=minutely,alerts,flags")
  end

  private

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
