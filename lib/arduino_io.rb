require 'lib/wincom'

class ArduinoIO < Serial
  def initialize(port_no)
    @io = Serial.new
    @port_no = port_no
    self.open
    @io
  end
  def open
    @io.open(@port_no,0x0000,115200,8,0,0,256,256)
  end
  def read
    @io.receive
  end
end
