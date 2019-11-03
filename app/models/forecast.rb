class Forecast
  attr_reader :id, :current_time, :current_date, :currently, :today, :hourly, :daily, :timezone, :coordinates

  def initialize(data)
    @id = rand(0..999)
    # @location = data
    @currently = data[:currently]
    @today = data[:daily][:data][0]
    @hourly = data[:hourly][:data]
    @daily = data[:daily][:data]
    @current_time = current_time
    @current_date = current_date
    @timezone = data[:timezone]
    @coordinates = "#{data[:latitude]}, #{data[:longitude]}"
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
