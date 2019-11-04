class Location
  attr_reader :id, :name, :lat, :lng, :coordinates, :city, :state, :country

  def initialize(data)
    @id = rand(0..999)
    @name = data[:results][0][:formatted_address]
    @lat = data[:results][0][:geometry][:location][:lat]
    @lng = data[:results][0][:geometry][:location][:lng]
    @coordinates = coordinates
    # @city = data[:results][0][:address_components][0][:long_name]
    # @state = data[:results][0][:address_components][2][:short_name]
    # @country = data[:results][0][:address_components][3][:long_name]
  end

  def coordinates
    "#{@lat},#{@lng}"
  end

end
