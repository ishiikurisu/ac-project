require "yaml"
require './src/logger/Logger.rb'
require "./src/weather/WeatherReporter.rb"

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

if __FILE__ == $0
    logger = Logger.new
    log_from_the_internet logger
    puts "Press [enter] to end logging"
    gets
end