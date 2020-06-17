#include "pitches.h" //include the note library

//notes in the melody
int melody[] = {
  NOTE_C4, NOTE_C4, NOTE_D4, NOTE_C4, NOTE_F4, NOTE_E4, NOTE_C4, NOTE_C4, NOTE_D4, NOTE_C4, NOTE_G4, NOTE_F4, NOTE_C4, NOTE_C4, NOTE_C5, NOTE_A4, NOTE_F4, NOTE_E4, NOTE_D4, NOTE_AS4, NOTE_AS4, NOTE_A4, NOTE_F4, NOTE_G4, NOTE_F4
};

//attaching a name to the pin with the button
int button = 12;

//note durations: 4 = quarter note, 8 = eight note, etc.
int noteDurations[] = {
  8, 8, 4, 4, 4, 2, 8, 8, 4, 4, 4, 2, 8, 8, 4, 4, 4, 4, 4, 8, 8, 4, 4, 4, 2, 
};

#include <Servo.h>

Servo myservo;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin

void setup() {
  // initialise input 
  pinMode(button, INPUT);

  myservo.attach(7);  // attaches the servo on pin 9 to the servo object

}

void loop() {
  // reading the input
  int buttonState = digitalRead(button);
   val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  myservo.write(val);                  // sets the servo position according to the scaled value
  delay(15);                           // waits for the servo to get there

  //what happens when button is pressed
  if (buttonState == 1){

   //go over the notes of the song
   for (int thisNote=0; thisNote <25; thisNote++){
   // to calculate note duration
   int noteDuration = 1130/noteDurations[thisNote];
    tone (8, melody[thisNote], noteDuration);

    //to distinguish between the notes there should be a pause between them
    int pause = noteDuration * 1.275;
    delay (pause);
    
    noTone(8);

   

  }
  
  }
}
