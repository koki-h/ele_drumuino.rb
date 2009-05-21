drum_channel = device.openChannel(9)
drum_channel.playMidiSound(MuteHighConga, velo)
case count % 2
  when 0
    drum_channel.playMidiSound(Cowbell, velo)
  when 1
end

case count % 8
  when 0
    drum_channel.playMidiSound(ShortWhistle, velo)
    drum_channel.playMidiSound(ShortGuiro, velo)
  when 1
    drum_channel.playMidiSound(ShortWhistle, velo)
  when 6
    drum_channel.playMidiSound(OpenHighConga, velo)
    drum_channel.playMidiSound(LongGuiro, velo)
  when 7
    drum_channel.playMidiSound(LowConga, velo)
end
case count % 4
  when 0
    drum_channel.playMidiSound(BassDrum1, velo)
    drum_channel.playMidiSound(LowBongo, velo)
  when 2,3
    drum_channel.playMidiSound(HighBongo, velo)
end
case count % 16
  when 0
    drum_channel.playMidiSound(CrashCymbal1, velo)
end
