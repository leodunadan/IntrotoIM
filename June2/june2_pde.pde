float speed = 0;
float x = 300;
float y = 5;

void setup()
{
  size(500,500);
  background (450, 45); //adds the colour
 
 
}

void draw() 
{
for (int y = 10; y<width; y+=10) {  //draws the ellipses vertically
  for (int x = 10; x<width; x+=10) { //draws the elipses horizontally
 ellipse(x,y, 10,10);
  }

  ellipse (x,y,20,20);
  y+=  speed;  // I did this because i wanted a line of ellipses on top and doing this while the whole thing is static and background doesngt refresh seemed like a way.

}
}
