//���l�̕ω����㏸���牺�~�ɕω������Ƃ��ɂ���MIDI�ɑ��M����
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
  //�A�i���O����0�ԃs���ɂ͈��d�X�s�[�J���Ȃ����Ă���B
  //�i���d�X�s�[�J�̔��Α���arduino��GND�ɂȂ��j
  int val = analogRead(0);
  shift(samples,val);
  int send_val = 0;
  if ((samples[0] < samples[1] && samples[1] > samples[2])
      && abs(samples[0] - samples[1]) > 10 && abs(samples[1] - samples[2]) > 10){
    send_val = samples[1];
    Serial.println(send_val / 8, DEC); //MIDI�ɑ���̂ōő�l��127�ɂȂ�悤�ɂ���
    delay(40);
  }
  delay(1);
}
