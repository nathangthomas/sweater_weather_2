class Forecast
  attr_reader :id, :location, :current_time, :current_date, :currently, :today, :hourly, :daily, :timezone, :coordinates

  def initialize(data)
    @id = rand(0..999)
    @currently = data[:currently]
    @today = data[:daily][:data][0]
    @hourly = data[:hourly][:data]
    @daily = data[:daily][:data]
    @current_time = current_time
    @current_date = current_date
    @timezone = data[:timezone]
    @coordinates = "#{data[:latitude]}, #{data[:longitude]}"
    @location = location
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

  def current_time
    date = @currently[:time]
    t = Time.new(date)
    t.strftime("%I:%M%p")
  end

  def current_date
    date = @currently[:time]
    t = Time.new(date)
    t.strftime("%A, %b. %d")
  end

end
