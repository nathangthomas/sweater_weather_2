class AmypodeService

  def conn
    Faraday.new(url: "http://amypode.herokuapp.com/api/v1/") do |f|
      f.headers['api_key'] = ENV['AMYPODE_API_KEY']
      f.params['lat'] = 22.3964272
      f.params['long'] = 114.1094971
      f.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get('antipodes')
  end

  def parsed_data
    JSON.parse(response.body, symbolize_names: true)
  end 

end
