class AntipodeFacade
  attr_reader :id

  def initialize(search_location)
    @id = rand(0..999)
    @search_location = search_location
    @antipode_name = antipode_name
    @location_name = antipode_name
  end

  def antipode_coordinates
    location = LocationsFacade.new('hong kong').location
    Antipode.new(AmypodeService.new.antipode_by(location))
    location.coordinates
  end

  def antipode_data
    GoogleService.new.city_by_coordinates(antipode_data.coordinates)
  end

  def antipode_name
    binding.pry
    antipode_data
  end

  def antipode_location_info

    # antipode_info = AmypodeService.new.antipode_by(@search_location)
  end
    # location_info = LocationsFacade.new('hong kong').location
    #
    # antipode_info = subject.antipode_by(location_info)

    # AmypodeService.new.antipode_by(@search_location)
    # LocationsFacade.new(@search_location).location
  end

  #
  # def forecast
  #   location = location(@city_state)
  #   Forecast.new(data_for(location))
  # end
  #
  # def city_image
  #   Image.new(image_for(@city_state))
  # end
  # private
  #
  # def data_for(location)
  #   @_data_for ||= DarkSkyService.new.forecast_by(location)
  # end
  #
  # def location(location)
  #   LocationsFacade.new(city_state).location
  # end
  #
  # def image_for(city_state)
  #   @_image_for ||= flickr_service
  # end
  #
  # def flickr_service
  #   FlickrService.new.image_of(@city_state)
  # end

# end
