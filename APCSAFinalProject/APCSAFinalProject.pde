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
  
  
    
  bg = loadImage("space.jpg");
  
  meteor = loadShape("meteor.svg");


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
  //float h = (float)Math.hypot(300, 500);
  //meteor.rotate(acos(h/200));
  y+=5;
  //background(bg);
   
  shape(meteor, 750, y, 80, 80);
  fill(255,25);
  rect(0,0,width,height);
}

public void mousePressed() {
  y-=200;
  meteor = meteorUp;
  delay(1000);
  meteor = meteorDown;
  
}
