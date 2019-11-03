class LocationsFacade
  attr_reader :id

  def initialize(city)
    @city = city
  end

  def location
    Location.new(data_for(@city))
  end

  private

  def data_for(city)
    @_data_for ||= GoogleService.new.location_by_city(city)
  end

end
