require "yaml"
require './src/logger/Logger.rb'
require "./src/weather/WeatherReporter.rb"
require "./src/weather/Arduino.rb"

def log_from_the_internet logger
    Thread.new do
        config = YAML.load_file './b/secrets.yml'
        reporter = WeatherReporter.new config['OWM_API']
        loop do
            entry = {
                'kind' => 'owm',
                'value' => reporter.temperature
            }
            timestamp = logger.add entry
            puts "new internet entry at #{timestamp}"
            sleep 120 # seconds
        end
    end
end

def log_from_arduino logger
    Thread.new do
        config = YAML.load_file './b/secrets.yml'
        arduino = Arduino.new config['ARDUINO']
        arduino.temperature
        arduino.light
        loop do
            entry = {
                'kind' => 'uno temp',
                'value' => arduino.temperature
            }
            timestamp = logger.add entry
            puts "new arduino temperature entry at #{timestamp}"
            entry = {
                'kind' => 'uno light',
                'value' => arduino.light
            }
            timestamp = logger.add entry
            puts "new arduino light entry at #{timestamp}"
            sleep 120 # seconds
        end
    end
end

if __FILE__ == $0
    logger = Logger.new
    log_from_the_internet logger
    log_from_arduino logger
    puts "Press [enter] to end logging"
    gets
end
