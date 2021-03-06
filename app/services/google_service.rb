class GoogleService

  def location_by_city(city)
    get_json("/maps/api/geocode/json?address=#{city}")
  end

  def time_to_travel_between(origin, destination)
    get_json("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")
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
