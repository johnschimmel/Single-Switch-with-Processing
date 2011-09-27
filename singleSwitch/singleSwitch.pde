//single key/mouse click event example
PImage penguin;
int x=0;
int y=0;
int xspeed=2;
int yspeed=5;
float dotWidth = 50;
color theColor;
ArrayList colorPath;

boolean firstRun = true;
void setup() {
  size(600, 580); //width, height

  penguin = loadImage("happyfeet.gif");

  colorPath = new ArrayList();
  theColor = color((int)random(50, 255), 200, 100);
}


void draw() {
  if (firstRun) {
    background(0); //white background
    firstRun=false;
  }

  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;

  // Remember, || means "or."
  if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    yspeed = yspeed * -1;
  }

  if (mousePressed) {
     theColor = color((int)random(50, 100), (int)random(150, 100),(int)random(150, 255));  
  }

  noStroke();
  fill(theColor);
  ellipse(x,y, (int)dotWidth, (int)dotWidth);
}


void mousePressed() {
  int tmpSpeed = xspeed;
  xspeed = yspeed;
  yspeed = tmpSpeed;
  float dotWidth=random(10,100);
 
}

