int val = 0;
int prev_val = 0;
void setup()
{
  Serial.begin(115200);
}

void loop()
{
  //�A�i���O����0�ԃs���ɂ͈��d�X�s�[�J���Ȃ����Ă���B
  //�i���d�X�s�[�J�̔��Α���arduino��GND�ɂȂ��j
  val = analogRead(0);�@
  if (abs(prev_val - val) > 20){
    Serial.println(val / 8, DEC); //MIDI�ɑ���̂ōő�l��127�ɂȂ�悤�ɂ���
  }
  prev_val = val;
  delay(10);�@//�▭�̃^�C�~���O�i��M����0.4�b���Ƃɂ���Ƃ��܂������j
}
