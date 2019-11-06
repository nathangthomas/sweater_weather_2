require "rails_helper"

describe FlickrService do
  context 'instance methods' do
    it "returns an image associated with a city" do
      

      image = subject.image_of('denver,co')

      expect(image).to be_an Hash
      expect(image[:photos][:photo].count).to eq(1)
      expect(image[:photos][:photo][0].keys).to eq([:id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily])
    end
  end
end
