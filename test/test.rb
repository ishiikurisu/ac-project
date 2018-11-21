require "./src/weather/WeatherReporter.rb"
require "minitest/autorun"
require "yaml"

class TestWeather < MiniTest::Test
    def setup
        config = YAML.load_file './b/secrets.yml'
        @reporter = WeatherReporter.new config['OWM_API']
    end

    def test_can_get_temperature
        assert @reporter.temperature > 15
    end
end