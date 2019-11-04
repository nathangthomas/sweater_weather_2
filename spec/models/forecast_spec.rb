# require "rails_helper"
#
# describe Forecast do
#   it "exists" do
#     response = File.read("./fixtures/dark_sky_data_denver.json")
#     data = JSON.parse(response, symbolize_names: true)

    #circle back to figure out how to stub out geocoder response

    # stub_request(:get, "https://nominatim.openstreetmap.org/reverse?accept-language=en&addressdetails=1&format=json&lat=39.7392358&lon=-104.990251").to_return(status: 200, body: "", headers: {})
    #
    # # allow_any_instance_of(DateTime).to receive(:to_time).and_return(1568599200)
    # forecast = Forecast.new(data)
#
#     expect(forecast).to be_a Forecast
#
#     expect(forecast.currently).to
#     expect(forecast.today).to
#     expect(forecast.tonight).to
#     expect(forecast.hourly).to
#     expect(forecast.daily).to
#   end
# end
