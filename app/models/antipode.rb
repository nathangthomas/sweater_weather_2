class Antipode
  attr_reader :lat, :lng, :coordinates

  def initialize(data)
    @id = rand(0..999)
    @lat = data[:data][:attributes][:lat]
    @lng = data[:data][:attributes][:long]
    @coordinates = "#{@lat},#{@lng}"
  end
end
