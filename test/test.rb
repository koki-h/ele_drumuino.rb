require 'lib/winMidiIF'
require 'test/mock/mock_arduino_io'
require 'lib/ele_drum'
midi = MidiDevice.new
aio = MockArduinoIO.new()
pattern = lambda do |velo, count, device|
  drum_channel = device.openChannel(9)
  drum_channel.playMidiSound(HIHAT_NOTE, velo)
  if (count % 5 == 0)
    drum_channel.playMidiSound(SNARE_NOTE, velo)
  end
  if (count % 8 == 0)
    drum_channel.playMidiSound(BASS_NOTE, velo)
  end
  piano = device.openChannel(0)
  piano.playMidiSound(32, velo/2)
end
drum = MidiDrum.new(midi, aio, pattern)
drum.wait
