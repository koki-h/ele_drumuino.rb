DUMMY_DATA = [
  1,1,1,1,1,1,1,1,
  1,1,1,1,1,1,1,1,
]

class INFINITE_DATA 
  def self.shift
    1 
  end
end

class MockArduinoIO
  @data_send = false
  def initialize(bpm = 120,data = DUMMY_DATA)
    @data = data
    @interval = 60.0 / bpm
  end
  def read
    if (@data_send)
      data = 0
      @data_send = false
    else
      data = @data.shift
      exit 0 unless data 
      @data_send = true
      sleep(@interval)
    end
    return 127 if (data && data != 0)
  end
end
