class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  attributes :location_name, :forecast

  attribute :search_locaiton do
    "DON'T FORGET TO COME BACK AND INCLUDE THE SEARCH LOCATION HERE"
  end 
end
