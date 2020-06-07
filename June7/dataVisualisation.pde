//Leo El-azhab 
//June 7
//I wanted to display the data in an abstact bar chart, abstract because the bars 
//dont represent direct values but rather scaled down to look best aesthetically. 
//I was aiming for something minimalistic.
//The data is taken from https://www.ndbc.noaa.gov


Table table; 
PFont font;
void setup() {
  size (1200, 1000);
  background(0);
  table = loadTable("data1.csv", "header"); 
  //header makes sure that the very top row is not considered as a row
  //println(table.getColumnCount()); (this is here for my own information)
  String[] fontlist = PFont.list();
  //printArray(fontlist);

  font = createFont("Gotham-Bold", 18);
  textFont(font, 18);
}


void draw() {
  background(255);
  fill(0);
  for (int i= 0; i< table.getRowCount(); i++) {
    text(table.getFloat(i, 0), 100, 30+ i*50);  
    //this goes through the first column and displays every lat value in a column
    //100 deterines position from the side and 30+i*50 makes sure its displayed 
    //equidistantly below each other
    rect(200, 30+ i*50, table.getFloat(i, 2)*8, table.getFloat(i, 3)/7);
    //this uses the third column (speed) to determine the length of the bar and 
    //the fourth (direction) column to determine the width
    //I multiplied and divived the value to scale the bars to look how I
    //want them to
  }
}
