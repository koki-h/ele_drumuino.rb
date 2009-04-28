drum_channel = device.openChannel(9)
drum_channel.playMidiSound(44, velo)
drum_channel.playMidiSound(36, velo)
if (count % 4 == 2)
  drum_channel.playMidiSound(38, velo)
end
if (count % 2 == 0)
end
