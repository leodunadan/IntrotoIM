// the setup function runs once when you press reset or power the board
//


void setup() {
  pinMode(8, OUTPUT);  //declare the inputs and outputs
  pinMode(13, OUTPUT);
  pinMode(A2, INPUT);
  pinMode(9, OUTPUT);
  pinMode(A3, INPUT);
  
  
  
}

// the loop function runs over and over again forever
void loop() {

  int reading = analogRead(A3); (Reading the voltage out by potentiometer //read the voltage from the pot
  int brightness = reading/4; //the reading is devided to make the range wider - make it more sensitive to turns of the pot
  analogWrite(9, brightness);//outputting the value to use to fade the LED

  int switchPosition = digitalRead(A2);

  if (switchPosition == HIGH) {
    digitalWrite(8, HIGH);   // turn the LED on (HIGH is the voltage level)
    digitalWrite(13, LOW);
  } else  {
    digitalWrite(8, LOW);    // turn the LED off by making the voltage LOW
    digitalWrite(13, HIGH);
  }
}
