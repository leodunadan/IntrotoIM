//Leo El-azhab
//Final
//Arduino code component
int ledPin = 13; // the pin that the LED is attached to
int incomingByte; // a variable to read incoming serial data into
int firstSensor = 0;    // the sensors
int secondSensor = 0;
int thirdSensor = 0;
int fourthSensor = 0;
int inByte = 0;         // incoming serial byte

void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);

//  establishContact();

}

void loop() {
  // see if there's incoming serial data:
  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    // if it's a capital H (ASCII 72), turn on the LED:
    if (incomingByte == 'H') {
      digitalWrite(ledPin, HIGH);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'L') {
      digitalWrite(ledPin, LOW);
    }
  }

  // if we get a valid byte, read these:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    // read the digital inputs:
    firstSensor = digitalRead(2);
    secondSensor = digitalRead(3);
    thirdSensor = digitalRead(4);
    fourthSensor = digitalRead(5);
    // send sensor values:
    Serial.print(firstSensor);
    Serial.print(",");
    Serial.print(secondSensor);
    Serial.print(",");
    Serial.println(thirdSensor);
    Serial.print(",");
    Serial.print(fourthSensor);
    Serial.print(",");
  }

//  void establishContact() {
//    while (Serial.available() <= 0) {
//      Serial.println("0,0,0");   // send an initial string
//      delay(300);
    }
  
