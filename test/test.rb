require "./src/weather/Arduino.rb"
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

class TestArduino < MiniTest::Test
    def setup
        config = YAML.load_file './b/secrets.yml'
        @arduino = Arduino.new config["ARDUINO"]
    end

    def test_can_get_measures
        temperature = @arduino.temperature
        light = @arduino.light
        assert temperature > 20
        assert light > 100
    end
end
