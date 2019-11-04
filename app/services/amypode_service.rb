class AmypodeService

  def antipode_by(location)
    conn = Faraday.new(url: "http://amypode.herokuapp.com/api/v1/") do |f|
      f.headers['api_key'] = ENV['AMYPODE_API_KEY']
      f.params['lat'] = "#{location.lat}"
      f.params['long'] = "#{location.lng}"
      f.adapter Faraday.default_adapter
    end
    response = conn.get('antipodes')
    JSON.parse(response.body, symbolize_names: true)
  end

  # def response
  #   conn.get('antipodes')
  # end

  # def parsed_data
  #   JSON.parse(response.body, symbolize_names: true)
  # end

end
