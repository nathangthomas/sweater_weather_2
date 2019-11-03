class Forecast
  attr_reader :id, :location, :current_time_and_date, :currently, :today, :hourly, :daily, :timezone, :coordinates

  def initialize(data)
    @id = rand(0..999)
    @currently = data[:currently]
    @today = data[:daily][:data][0]
    @hourly = data[:hourly][:data]
    @daily = data[:daily][:data]
    @current_time_and_date = current_time_and_date
    @timezone = data[:timezone]
    @coordinates = "#{data[:latitude]}, #{data[:longitude]}"
    @location = location
  end

  def current_time_and_date
    date = @currently[:time]
    t = Time.new(date)
    t.strftime("%I%p, %m/%d")
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
