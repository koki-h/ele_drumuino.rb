require 'lib/wincom'

class ArduinoIO
  ARE_YOU_DRUMUINO = "0"
  I_AM_DRUMUINO    = "1"
  def auto_detect
    1.upto 10 do | port_no |
      begin
        io = Serial.new
        io.open(port_no,0x0000,115200,8,0,0,256,256)
        100.times do
          io.send(ARE_YOU_DRUMUINO)
          msg = io.receive
          if msg == I_AM_DRUMUINO
            return io, port_no
          end
          sleep(0.01)
        end
      rescue
        next
      end
      io.close
    end
    raise "NO PORT FOUND."
  end
  def initialize(port_no=nil)
    if port_no
      @io = Serial.new
      @port_no = port_no  #COMÉ|Å[ÉgÇÃî‘çÜ
      @io.open(@port_no,0x0000,115200,8,0,0,256,256)
    else
      @io, @port_no = auto_detect
    end
    @io
  end
  def read
    @io.receive
  end
  def port_no
    @port_no
  end
end
