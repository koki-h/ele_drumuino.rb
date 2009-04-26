BASS_NOTE = 36
SNARE_NOTE = 40
HIHAT_NOTE = 42
class MidiDrum
  def initialize(midi_device, arduino_io, pattern = nil)
    @midi = midi_device
    @aio  = arduino_io
    @pattern = pattern || lambda{|velo,count,device| default_pattern(velo,count)}
    p pattern
  end

  def default_pattern(velo,count)
    drum_channel = @midi.openChannel(9)
    drum_channel.playMidiSound(HIHAT_NOTE,velo)
    if (count % 4 == 2)
      drum_channel.playMidiSound(SNARE_NOTE,velo)
    end
    if (count % 8 == 0)
      drum_channel.playMidiSound(BASS_NOTE,velo)
    end
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
      sleep(0.04) #絶妙のタイミング（arduino側は0.01秒ごとにメッセージ送出）
    end
  end
end
