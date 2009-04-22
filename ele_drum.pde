int val = 0;
int prev_val = 0;
void setup()
{
  Serial.begin(115200);
}

void loop()
{
  //アナログ入力0番ピンには圧電スピーカがつながっている。
  //（圧電スピーカの反対側はarduinoのGNDにつなぐ）
  val = analogRead(0);　
  if (abs(prev_val - val) > 20){
    Serial.println(val / 8, DEC); //MIDIに送るので最大値が127になるようにする
  }
  prev_val = val;
  delay(10);　//絶妙のタイミング（受信側を0.4秒ごとにするとうまくいく）
}
