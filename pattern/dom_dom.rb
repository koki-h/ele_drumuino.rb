drum_channel = device.openChannel(9)
if (count % 2 == 0)
  drum_channel.playMidiSound(BassDrum2, velo)
end
if (count % 8 == 3)
  drum_channel.playMidiSound(ClosedHiHat, velo)
end
