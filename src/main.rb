require './src/logger/Logger.rb'

if __FILE__ == $0
    logger = Logger.new
    prng = Random.new
    5.times do
        entry = {
            'kind' => 'test',
            'value' => prng.rand(15.1...41.3)
        }
        logger.add entry
    end
end