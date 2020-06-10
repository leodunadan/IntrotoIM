import java.util.Timer;
import java.util.TimerTask; // making sure it knows what Timer is
int gameScreen = 0; //initializing everything
float diverX, diverY;
int diverSize = 100;
//int diverColour = color(0);  //just in case i want to use a shape
float gravity = 0.1;
float diverSpeedVert = 0;
float airfriction = 0.0001;
float friction = 0.1;
color racketColour = color(0);
float racketWidth = 200;
float racketHeight = 20;
int racketBounceRate = 20;
float diverSpeedHorizon = 10;
int time; 
Timer timer = new Timer();
PFont font;
PImage diver;

//Leo El-azhab
//June 10 - Midterm
//This is a game where you have to keep the diver from sinking for as long as you can
//Instructions: Use your mouse to move the racket to keep the diver from sinking 

void setup(){
  size(1000, 1000);
  diverX=width/3;   //sets up where the diver appears
  diverY=height/4;
  String[] fontList = PFont.list();
  printArray(fontList);
  diver = loadImage("diver.png");

  font = createFont("Gotham", 32);
  textFont(font, 32);

}
void draw(){
  if (gameScreen ==0){    //shows you the contents of the screen you are on
    startScreen();
  } else if (gameScreen ==1) {
    gameScreen();
  } else if (gameScreen ==2) {
    gameOverScreen();
  }
  
}
  
void startScreen() {  //appearance of the Start Screen
  background(0);
  textAlign(CENTER);
  text("CLICK TO START PLAYING", height/2, width/3); //text and its position
  text("keep the diver from sinking", height/2, width/2);
}

void gameScreen() {  //this starts the game screen and everything that happens when the game starts
  background(204, 255, 255);
  
  timer.scheduleAtFixedRate(new TimerTask(){ //starts the timer
    public void run(){
      time ++;  //basically counts from 0 upwards
      println(time);
    }
    }, 0,1*1000);  // no idea what this does but it solved an issue that I had with the timer
  drawDiver();
  applyGravity();
  keepInScreen();
  drawRacket();
  racketBounce();
  applyHorizontalSpeed();

}

void gameOverScreen() {  // contents of the gameover screen
  background(255);
  textAlign(CENTER);
  text("YOU SANK", height/2, width/2); //position of text
  text(time,height/2, width/3); //position of time
}

public void mousePressed() { // when you click, if gameScreen was on 0 it will star game and set off everthing that happens when game starts
  if (gameScreen == 0){
    startGame();
  }
  
    
  
  }


void startGame() {  //changed the value of game screen so it can later be used to move to game over screen
  gameScreen = 1;
  
}

void drawDiver() { //creates the diver
  //fill(diverColour);
  //ellipse(diverX, diverY, diverSize, diverSize); // just in case i want to use a shape inspead of the image 
  imageMode(CENTER);
  image(diver, diverX,diverY,diverSize,diverSize);
}

void applyGravity() {   //makes the diver bounce up and down at the same rate
  diverSpeedVert += gravity;
  diverY += diverSpeedVert;
  diverSpeedVert -= (diverSpeedVert * airfriction);  //using airfriction and friction is what makes 
  //the diver slow down in bouncing/ bounce less high over time till it eventually stops
}
void makeBounceBottom(float surface) {
  diverY = surface-(diverSize/2);
  diverSpeedVert*=-1;
  diverSpeedVert -= (diverSpeedVert * friction);
}
void makeBounceTop(float surface) {
  diverY = surface+(diverSize/2);
  diverSpeedVert*=-1;
  diverSpeedVert -= (diverSpeedVert * friction);
  }
// keeps diver in the screen
void keepInScreen() {
  // diver hits floor
  if (diverY+(diverSize/2) > height) { 
    makeBounceBottom(height);
    gameScreen = 2;  // this lets us change to game over screen
    timer.cancel(); //stops the timer
    
    
  }
  // diver hits ceiling and bounces off
  if (diverY-(diverSize/2) < 0) {
    makeBounceTop(0);
  }
  if (diverX-(diverSize/2) < 0){
    makeBounceLeft(0);
  }
  if (diverX+(diverSize/2) > width){
    makeBounceRight(width);
  }
}

void drawRacket(){  //draws the bar you move
  fill(racketColour);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight);
}

void applyHorizontalSpeed(){  // same as above for vertical - controls horixontal movement of the ball
  diverX += diverSpeedHorizon;
  diverSpeedHorizon -= (diverSpeedHorizon * airfriction);
}
void makeBounceLeft(float surface){
  diverX = surface+(diverSize/2);
  diverSpeedHorizon*=-1;
  diverSpeedHorizon -= (diverSpeedHorizon * friction);
}
void makeBounceRight(float surface){
  diverX = surface-(diverSize/2);
  diverSpeedHorizon*=-1;
  diverSpeedHorizon -= (diverSpeedHorizon * friction);

}

void racketBounce() {    //controls the bouncing off the diver off the racket
  float overhead = mouseY - pmouseY;
  if ((diverX+(diverSize/2) > mouseX-(racketWidth/2)) && (diverX-(diverSize/2) < mouseX+(racketWidth/2))) {
    if (dist(diverX, diverY, diverX, mouseY)<=(diverSize/2)+abs(overhead)) {
      makeBounceBottom(mouseY);
      // racket moving up
      if (overhead<0) {
        diverY+=overhead;
        diverSpeedVert+=overhead;
      }
    }
  }
}
