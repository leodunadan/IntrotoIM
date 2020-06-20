int sensorPin = A0;

void setup() {
  analogReference(Default);
  Serial.begin(9600);

}

void loop() {
  //200 and 750 should have been dependent on values from my photoresistor
  int val = map(analogRead(sensorPin), 200, 750, 0, 500);
  Serial.println(analogRead(sensorPin));
  delay(100);
}
