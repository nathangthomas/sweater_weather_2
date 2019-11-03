require "rails_helper"

describe Image do
  it "exists" do
    flickr_data = File.read("./fixtures/denver_flickr.json")
    response =  JSON.parse(flickr_data, symbolize_names: true)
    image = Image.new(response)

    expect(image).to be_an Image
    expect(image.flickr_url).to eq("https://farm1.staticflickr.com/930/43691964192_4ff507454d.jpg")
  end
end
