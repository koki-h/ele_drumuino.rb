class MockArduinoIO
  @data_send = false
  def initialize(data = nil, interval = 0.1)
    @data = data
    @data = [
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,
    ] unless data
    @interval = interval
  end
  def read
    if (@data_send)
      data = 0
      @data_send = false
    else
      data = @data.shift
      @data_send = true
      sleep(@interval)
    end
    return 127 if (data && data != 0)
  end
end
