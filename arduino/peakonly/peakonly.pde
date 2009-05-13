//数値の変化が上昇から下降に変化したときにだけMIDIに送信する
int samples[] = {0,0,0};
int sample_idx = 0;
int prev_val = 0;
void shift(int array[],int val){
  for(int i=0; i < sizeof(array) - 1; i++){
    array[i] = array[i + 1];
  }
  array[sizeof(array) -1 ] = val;
}
void setup()
{
  Serial.begin(115200);
}

void loop()
{
  //アナログ入力0番ピンには圧電スピーカがつながっている。
  //（圧電スピーカの反対側はarduinoのGNDにつなぐ）
  int val = analogRead(0);
  shift(samples,val);
  int send_val = 0;
  if ((samples[0] < samples[1] && samples[1] > samples[2])
      && abs(samples[0] - samples[1]) > 10 && abs(samples[1] - samples[2]) > 10){
    send_val = samples[1];
    Serial.println(send_val / 8, DEC); //MIDIに送るので最大値が127になるようにする
    delay(40);
  }
  delay(1);
}
