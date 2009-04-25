require 'lib/winMidiIF'
require 'lib/arduino_io'
require 'lib/ele_drum'
midi = MidiDevice.new
aio = ArduinoIO.new(6)
drum = MidiDrum.new(midi,aio)
drum.wait
