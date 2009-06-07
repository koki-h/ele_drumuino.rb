require 'optparse'

require 'lib/winMidiIF'
require 'test/mock/mock_arduino_io'
require 'lib/ele_drum'
require 'lib/song_pattern'

infinite = false
ARGV.options {|opt|
  #音色・音階の名前リストを表示する
  opt.on('-i') do
    infinite = true
    puts 'infinite play.'
  end
  opt.parse!
}

output = MidiDevice.new
unless infinite
  input = MockArduinoIO.new(600)
else
  input = MockArduinoIO.new(600, INFINITE_DATA)
end
pattern_file = ARGV[0]
pattern = SongPattern::load(pattern_file)
drum = MidiDrum.new(output, input, pattern)
drum.wait
