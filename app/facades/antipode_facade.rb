class AntipodeFacade
  attr_reader :id

  def initialize(search_location)
    @id = rand(0..999)
    @search_location = search_location
    @antipode_name = antipode_name
    @location_name = antipode_name
    @forecast = forecast
    binding.pry
  end

  def forecast
    DarkSkyService.new.forecast_by(antipode_coordinates)
  end

  def antipode_coordinates
    location = LocationsFacade.new('hong kong').location
    antipode = Antipode.new(AmypodeService.new.antipode_by(location))
    binding.pry
    antipode.coordinates
  end

  def antipode_data
    GoogleService.new.city_by_coordinates(antipode_coordinates)
  end

  def antipode_name
    city_info = antipode_data[:plus_code][:compound_code]
    array = city_info.split(" ")
    "#{array[2]}#{array[3]}"
  end

end
