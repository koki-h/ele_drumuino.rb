BASS_NOTE = 36
SNARE_NOTE = 40
HIHAT_NOTE = 42
class MidiDrum
  def initialize(midi_device,arduino_io)
    @midi = midi_device
    @aio  = arduino_io
    @drum_cannel = @midi.openChannel(9)
  end
  def play(velo,count)
    @drum_cannel.playMidiSound(HIHAT_NOTE,velo)
    if (count % 4 == 2)
      @drum_cannel.playMidiSound(SNARE_NOTE,velo)
    end
    if (count % 8 == 0)
      @drum_cannel.playMidiSound(BASS_NOTE,velo)
    end
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
