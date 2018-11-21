require 'date'

class Logger
    def initialize
        @where = './b/output.csv'
    end

    # includes a new entry in the output table.
    # an entry is a hash with two keys: a kind
    # and the value to be stored. a new line with this
    # value and the current time it is added will be
    # created in the file
    def add entry
        kind = entry['kind']
        value = entry['value']
        timestamp = Time.now.strftime "%d/%m/%Y %H:%M:%S"
        line = "#{kind}\t#{timestamp}\t#{value}\n"
        File.open @where, 'a' do |fp|
            fp.write line
        end
    end
end