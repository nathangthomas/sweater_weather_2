class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :flickr_url
end
