//Leo El-azhab
//June 8
// This program gives you a drawing and allows you to pain over it and edit it however you like.
//click down your mouse and drag to be able to paint
PImage bear;
color colour;


void setup() {
  size(1000, 900);
  bear = loadImage("bear.jpg");
  image(bear, 0, 0, 1000, 900);
}


void draw() {
  //allows you to draw when you press down on the mouse
  if (mousePressed == true) {
    colour = bear.get(mouseX, mouseY); //should be able to colour pick the colour to use
    stroke(colour);
    line(pmouseX, pmouseY, mouseX, mouseY); //draws the line if mouse is clicked
    
  }
}
