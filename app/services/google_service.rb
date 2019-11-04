class GoogleService

  def location_by_city(city)
    get_json("/maps/api/geocode/json?address=#{city}")
  end

  def city_by_coordinates(coords)
    get_json("/maps/api/geocode/json?latlng=#{coords}")
    # https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=YOUR_API_KEY
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
