require 'lib/winMidiIF'
require 'lib/arduino_io'
require 'lib/ele_drum'
require 'lib/song_pattern'

output = MidiDevice.new
input = ArduinoIO.new(6)
pattern_file = ARGV[0]
pattern = SongPattern::load(pattern_file)
drum = MidiDrum.new(output, input, pattern)
drum.wait
