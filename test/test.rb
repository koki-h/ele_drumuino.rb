require 'lib/winMidiIF'
require 'test/mock/mock_arduino_io'
require 'lib/ele_drum'
midi = MidiDevice.new
aio = MockArduinoIO.new()
drum = MidiDrum.new(midi,aio)
drum.wait
