class FlickrService
  def image_of(city)
    get_json("/services/rest/?text=#{city}, skyline")
  end

  private

  def conn
    Faraday.new(url: "https://www.flickr.com") do |f|
      f.params['method'] = "flickr.photos.search"
      f.params['api_key'] = ENV['FLICKR_API_KEY']
      f.params['geo_context'] = 2
      f.params['per_page'] = 1
      f.params['accuracy'] = 12
      f.params['safe_search'] = 1
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
