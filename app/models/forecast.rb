class Forecast
  attr_reader :id, :location, :currently, :today, :tonight, :hourly, :daily, :timezone, :coordinates

  def initialize(data)
    @id = rand(0..999)
    @currently = data[:currently]
    @today = data[:daily][:data][0]
    @hourly = data[:hourly][:data]
    @tonight = tonights_weather
    @daily = data[:daily][:data]
    @timezone = data[:timezone]
    @coordinates = "#{data[:latitude]}, #{data[:longitude]}"
    @location = location
  end

  def tonights_weather
    weather = nil
    @hourly.each do |hour|
      t = Time.strptime("#{hour[:time]}",'%s')
      time = t.to_s.split(" ")[1].split(":")[0]
      if time == "22"
       weather = hour
      end
    end
   weather
  end

  def location
    location = Geocoder.search(@coordinates)
    info = location[0].data['address']
    city = info['city']
    state = info['state']
    # zip = info['postcode']
    # country = info['country']
    "#{city}, #{state}"
  end
end
