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
  //�A�i���O����0�ԃs���ɂ͈��d�X�s�[�J���Ȃ����Ă���B
  //�i���d�X�s�[�J�̔��Α���arduino��GND�ɂȂ��j
  int val = analogRead(0);
  //�T���v����5����A�ő�̂��̂𑗐M����
  int send_val = 0;
  if (sample_idx < sizeof(samples)){
    samples[sample_idx] = val;
    sample_idx++;
  }else{
    send_val = max_in_arr(samples); 
    Serial.println(send_val / 8, DEC); //MIDI�ɑ���̂ōő�l��127�ɂȂ�悤�ɂ���
    sample_idx = 0;
  }
  delay(10);
}
