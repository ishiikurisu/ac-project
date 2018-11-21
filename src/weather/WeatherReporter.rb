require 'net/http'
require 'json'

class WeatherReporter
    def initialize api
        @api = api
    end

    def temperature
        lat = -15.82
        lon = -47.97
        url = URI "http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{@api}"
        res = Net::HTTP.get url
        obj = JSON.parse res
        obj['main']['temp'] - 273 # converting from kelvin to celsius
    end
end