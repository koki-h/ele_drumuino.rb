drum_channel = device.openChannel(9)
drum_channel.playMidiSound(PedalHiHat, velo)
drum_channel.playMidiSound(BassDrum1, velo)
if (count % 4 == 2)
  drum_channel.playMidiSound(SnareDrum1, velo)
end
if (count % 2 == 0)
end
