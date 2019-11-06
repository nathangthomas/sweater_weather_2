# README

## Run Sweater Weather on your local machine
1. `$ git clone git@github.com:nathangthomas/sweater_weather_2.git`
2. `$ bundle`
3. `$ bundle exec figaro install` (Add the following API keys to ./config/application.yml:)

`GOOGLE_API_KEY: <your google api key here>`
`DARK_SKY_API_KEY: <your dark sky api key here>`
`FLICKR_API_KEY: <your flickr api key here>`
`GIPHY_API_KEY: ,your giphy api key here`

4. `$ bundle exec rspec install`
5. `$ rails db:{create,migrate}`
6. You can run test suite with `$ bundle exec rspec`
7. Start a local server with `$ rails s` and access Sweater Weather in your browser at localhost:3000
8. You can also interact with Sweater Weather here => https://ancient-fortress-22550.herokuapp.com/


## Available Endpoints

### User account creation (pass email, password, and password confirmation in body - returns API key)
- `POST '/api/v1/users'`

### User Log In (pass email and password in body - returns API key)
- `PSST '/api/v1/sessions'`

### Data Points
- `GET '/api/v1/location?location=<city,state>'` (returns coordinates for a given location)
- `GET '/api/v1/forecast?location=<city,state>'` (returns forecast data for a given location)
- `GET '/api/v1/backgrounds?location=<city,state>'` (returns a background image for a given city)
- `GET '/api/v1/antipode?location=<search_param>'` (returns a location's antipode and it's weather) -- don't forget to merge this from your assessment branch
- `GET '/api/v1/gifs?location=<city,state>'` (returns a gif related to the forecast for each hour of the day)
- `POST '/api/v1/road_trip'` (pass origin, destination, and api_key in body - returns estimated travel time and the weather for your time of arrival)
