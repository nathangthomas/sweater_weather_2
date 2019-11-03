class Image
  attr_reader :id, :flickr_url

  def initialize(data)
    @id = rand(0..999)
    @flickr_url = farm_url(data)
  end

  def farm_url(data)
    the = data[:photos][:photo][0]
    farm = the[:farm]
    server = the[:server]
    id = the[:id]
    secret = the[:secret]
    "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
  end
end
