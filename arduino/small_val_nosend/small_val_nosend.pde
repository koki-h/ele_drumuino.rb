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
  //�A�i���O����0�ԃs���ɂ͈��d�X�s�[�J���Ȃ����Ă���B
  //�i���d�X�s�[�J�̔��Α���arduino��GND�ɂȂ��j
  val = analogRead(0);
  if (abs(prev_val - val) > 10 ){    //�ׂ�������U���͑���Ȃ�
    Serial.println(127, DEC);    //MIDI�ɑ���̂ōő�l��127�ɂȂ�悤�ɂ���
    led_blink(val);
    delay(9);                        //�m�C�Y�����Ȃ��悤�Ƀf�[�^�𑗂����Ƃ���9�~���b�҂�
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
