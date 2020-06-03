class Sun {
  
  float x;
  float y;
  float i;

  void descend() {
    y++;
    x = x + random(-2, 2);
  }

  void display() {
    stroke(0);
    fill(255, 255, 0);
    ellipse(width/2, y, 200, 200);
  }
}

  Sun s;

  void setup() {
    size(640, 640);
    
  }

  void draw() { 
    s.display();
    s.descend();
    i=1;
    if (i<=20);
    star(random(100), random(100));
    i+=1;
  }

  void star(float x, float y) {
    beginShape();
    fill(102);
    stroke(255);
    strokeWeight(2);
    vertex(x, y-50);
    vertex(x+14, y-20);
    vertex(x+47, y-15);
    vertex(x+23, y+7);
    vertex(x+29, y+40);
    vertex(x, y+25);
    vertex(x-29, y+40);
    vertex(x-23, y+7);
    vertex(x-47, y-15);
    vertex(x-14, y-20);
    endShape(CLOSE);
  }
}
