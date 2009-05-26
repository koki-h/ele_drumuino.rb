drum_channel = device.openChannel(9)
case count % 8
  when 0,4
    drum_channel.playMidiSound(HighBongo, velo)
  when 2,3,6
    drum_channel.playMidiSound(LowBongo, velo)
  when 5
    drum_channel.playMidiSound(ShortWhistle, velo)
  when 7
    drum_channel.playMidiSound(LongGuiro, velo)
end
