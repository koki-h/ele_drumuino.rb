drum_channel = device.openChannel(9)
drum_channel.playMidiSound(ClosedHiHat, velo)
if (count % 4 == 2)
  drum_channel.playMidiSound(SnareDrum2, velo)
end
if (count % 8 == 0)
  drum_channel.playMidiSound(BassDrum1, velo)
end
