class Forecast
  attr_reader :id, :currently, :today, :tonight, :hourly, :daily, :timezone, :coordinates

  def initialize(data)
    @id = rand(0..999)
    @currently = data[:currently]
    @today = data[:daily][:data][0]
    @hourly = data[:hourly][:data]
    @tonight = tonights_weather
    @daily = data[:daily][:data]
    @timezone = data[:timezone]
    @coordinates = "#{data[:latitude]}, #{data[:longitude]}"
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

end
