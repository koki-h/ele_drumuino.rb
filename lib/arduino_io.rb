require 'lib/wincom'

class ArduinoIO
  def initialize(port_no)
    @io = Serial.new
    @port_no = port_no
    @io.open(@port_no,0x0000,115200,8,0,0,256,256)
    @io
  end
  def read
    @io.receive
  end
end
