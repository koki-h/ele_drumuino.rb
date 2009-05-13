require 'rubygems'
require 'midiator'
include MIDIator::Drums
include MIDIator::Notes
class MidiDrum
  def initialize(midi_device, arduino_io, pattern)
    @midi = midi_device
    @aio  = arduino_io
    @pattern = pattern
    p pattern
  end

  def play(velo,count)
    @pattern.call(velo,count,@midi)
  end

  def wait
    note_on = false
    count = 0
    while 1 do
      data = @aio.read;
      if data
        velo = data.to_i
        puts velo
      else
        velo = 0
      end
      if (velo > 0 && !note_on)
        play(velo,count)
        note_on = true
        count += 1
      elsif (velo <= 0 && note_on)
        note_on = false
      end
      sleep(0.04) #パッドを叩いたときに電位が0に戻るまでの大体の時間
    end
  end
end
