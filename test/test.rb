require 'lib/winMidiIF'
require 'test/mock/mock_arduino_io'
require 'lib/ele_drum'
require 'lib/song_pattern'

output = MidiDevice.new
input = MockArduinoIO.new()
pattern_file = ARGV[0]
pattern = SongPattern::load(pattern_file)
drum = MidiDrum.new(output, input, pattern)
drum.wait
