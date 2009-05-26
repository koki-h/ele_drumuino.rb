int val = 0;
int prev_val = 0;
int redPin = 9;
int greenPin = 10;
int bluePin = 11;

void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  Serial.begin(115200);
}

void loop()
{
  //アナログ入力0番ピンには圧電スピーカがつながっている。
  //（圧電スピーカの反対側はarduinoのGNDにつなぐ）
  val = analogRead(0);
  if (abs(prev_val - val) > 10 ){    //細かすぎる振動は送らない
    Serial.println(127, DEC);    //MIDIに送るので最大値が127になるようにする
    led_blink(val);
    delay(9);                        //ノイズが乗らないようにデータを送ったときは9ミリ秒待つ
  }
  prev_val = val;
}

void led_blink(int val){
    switch(val % 7){
      case 0:
        digitalWrite(redPin,   HIGH);
        digitalWrite(greenPin, HIGH);
        digitalWrite(bluePin,  HIGH);
        break;
      case 1:
        digitalWrite(redPin,   HIGH);
        digitalWrite(greenPin, HIGH);
        digitalWrite(bluePin,  LOW);
        break;
      case 2:
        digitalWrite(redPin,   HIGH);
        digitalWrite(greenPin, LOW);
        digitalWrite(bluePin,  HIGH);
        break;
      case 3:
        digitalWrite(redPin,   HIGH);
        digitalWrite(greenPin, LOW);
        digitalWrite(bluePin,  LOW);
        break;
      case 4:
        digitalWrite(redPin,   LOW);
        digitalWrite(greenPin, HIGH);
        digitalWrite(bluePin,  HIGH);
        break;
      case 5:
        digitalWrite(redPin,   LOW);
        digitalWrite(greenPin, HIGH);
        digitalWrite(bluePin,  LOW);
        break;
      case 6:
        digitalWrite(redPin,   LOW);
        digitalWrite(greenPin, LOW);
        digitalWrite(bluePin,  HIGH);
        break;
      case 7:
        digitalWrite(redPin,   LOW);
        digitalWrite(greenPin, LOW);
        digitalWrite(bluePin,  LOW);
        break;
      }
}
