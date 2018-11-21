require 'rubyserial'

class Arduino
    def initialize port
        @arduino = Serial.new port
    end

    def comm msg
        @arduino.write "#{msg}\r\n"
        sleep 2
        @arduino.read 16
    end

    def temperature
        comm("t").chomp.to_f
    end

    def light
        comm("l").chomp.to_f
    end
end
