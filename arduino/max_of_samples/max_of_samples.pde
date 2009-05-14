int samples[10];
int sample_idx = 0;

int max_in_arr(int array[]){
  int max_val=0;
  for(int i=0; i < sizeof(array); i++){
    if (array[i] > max_val){
      max_val = array[i];
    }
  }
  return max_val;
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
  //サンプルを5回取り、最大のものを送信する
  int send_val = 0;
  if (sample_idx < sizeof(samples)){
    samples[sample_idx] = val;
    sample_idx++;
  }else{
    send_val = max_in_arr(samples); 
    Serial.println(send_val / 8, DEC); //MIDIに送るので最大値が127になるようにする
    sample_idx = 0;
    delay(40);
  }
  delay(10);
}
