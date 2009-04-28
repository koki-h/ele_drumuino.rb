drum_channel = device.openChannel(9)
drum_channel.playMidiSound(62, velo) #Mute Hi Conga
case count % 2
  when 0
    drum_channel.playMidiSound(56, velo) #Cowbell
end

case count % 8
  when 0
    drum_channel.playMidiSound(71, velo) #Short Whistle
    drum_channel.playMidiSound(73, velo) #Short Guiro
  when 1
    drum_channel.playMidiSound(72, velo) #Short Whistle 
  when 6
    drum_channel.playMidiSound(63, velo) #Open Hi Conga
    drum_channel.playMidiSound(74, velo) #Long Guiro
  when 7
    drum_channel.playMidiSound(64, velo) #Low Conga
end
case count % 4
  when 0
    drum_channel.playMidiSound(36, velo) #Bass Drum1
    drum_channel.playMidiSound(61, velo) #Low Bongo
  when 2,3
    drum_channel.playMidiSound(60, velo) #High Bongo
end
case count % 16
  when 0
    drum_channel.playMidiSound(49, velo) #Crash Cymbal
end
