/**
 * Background Image. 
 * 
 * This example presents the fastest way to load a background image
 * into Processing. To load an image as the background, it must be
 * the same width and height as the program.
 */

PImage bg;
int y = 480;
PShape object;
PShape meteor;
PShape meteorUp;
PShape meteorDown;
String status = "normal";
double angle = 0;

void setup() {
  size(1531, 980);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  
    
  bg = loadImage("space.jpg");
  
  meteor = loadShape("meteor.svg");
  meteorUp = loadShape("meteorUp.svg");
  meteorDown = loadShape("meteorDown.svg");

}

void draw() {
  /*switch(status) {
  case "up":
    object = meteorUp;
    y-=20;
    break;
  case "down":
    object = meteorDown;
    break;
  case "normal":
    object = meteor;
  default:
    object = meteor;
}*/
  meteor.rotate((float)(angle-atan(500/(y+1))));
  y+=5;
  background(bg);
   shape(meteor, 750, y, 80, 80);
}

public void mousePressed() {
  for(int i = 0; i<20; i++) {
    
y-=20;
}
}
