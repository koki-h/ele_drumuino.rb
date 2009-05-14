require 'optparse'

require 'lib/winMidiIF'
require 'lib/arduino_io'
require 'lib/ele_drum'
require 'lib/song_pattern'
require 'lib/help.rb'

ARGV.options {|opt|
    #音色・音階の名前リストを表示する
    opt.on('--drums') do
      Help::print_drums
      exit 0
    end
    opt.on('--notes') do
      Help::print_notes
      exit 0
    end

    opt.parse!
}

output = MidiDevice.new
input = ArduinoIO.new(6)
pattern_file = ARGV[0]
pattern = SongPattern::load(pattern_file)
drum = MidiDrum.new(output, input, pattern)
drum.wait
