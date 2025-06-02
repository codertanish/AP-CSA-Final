PImage bg;
int y;
PShape object;
PShape meteor;
boolean end = false;
double angle = 0;
float ySpeed = 0;
boolean j = false;
double m;
Bird b;
Obstacle o;
PFont mono;
int score;

void setup() {
  size(1531, 980);
  mono = createFont("cmunbmo.ttf", 128);
  
    
  bg = loadImage("space.jpg");
  b = new Bird(0.0, width/2.0, height/2.0, 0.4, 10);
  o = new Obstacle();
  meteor = loadShape("meteor.svg");
  y=height/2;
  textSize(10);
  


}

void draw() {
ellipseMode(CENTER);
background(bg);
b.update();
b.gravity();
b.gravitationalAcceleration();
b.detectCollisions();
o.move();
o.update();
o.detect(b);
  
}

public void mousePressed() {
  b.jump();
}

public class Bird {
  float ySpeed, x, y;
  double gc;
  int jump;
public Bird(float ySpeed, float x, float y, double gravitationalConstant, int jump) {
  this.ySpeed = ySpeed;
  this.x = x;
  this.y = y;
  this.jump = jump;
  gc = gravitationalConstant;
}

public void jump() {
//  if(!j) {
  if(!end) {
    ySpeed -= jump; 
  }
  
  if(end) {
  end = false;
  b.reset(0.0, width/2.0, height/2.0, 0.4, 10);
  }
 // }
}

public float getX() {
return x;
}

public float getY() {
return y;
}

public void gravity() {
 if(!end) y += ySpeed;
}

public void gravitationalAcceleration() {
 if(!end) ySpeed += gc; jump += gc/2;
}

public void update() {
  if(!end) {
    
  shape(meteor, x, y, 50, 50);
  
  textAlign(CENTER);
  textFont(mono);
  fill(255);
  textSize(20);
  text("Score: " + score, 50, 30);
  }
  
  else {
    fill(18, 171, 105);
    rect(0, 0, 1531, 980);
    textSize(100);
    textAlign(CENTER);
    textFont(mono);
    fill(0);
    text("Game Over!", width/2, height/2);
    
    textSize(25);
    text("You scored " + score + " points. Click the screen to play again!", width/2, height/2 + 50);
  }
}

public void detectCollisions() {
  if(y<-50 || y>980) {
    end = true;
  }
}

public void reset(float ySpeed, float x, float y, double gravitationalConstant, int jump) {
  this.ySpeed = ySpeed;
  this.x = x;
  this.y = y;
  this.jump = jump;
  gc = gravitationalConstant;
  score = 0;
}

}

public class Obstacle { 
  int x, y;
  int[][] hitzone = {{740, y+25}, {790, y+50}};
public Obstacle() {
  x = 1700;
  y = (int)(Math.random() * 600 + 200);
}

public void move() {
  if(!end) x-=score/2 + 7;
}

public void update() {
  if(!end) {
  fill(89, 189, 39);
  rectMode(CORNER);
  rect(x, -100, 75, y);
  rect(x, y+75, 75, 1600 - (y+75));
  
  fill(102, 160, 79);
  rect(x-15, y-100, 105, 25);
  rect(x-15, y+75, 105, 25);

  replenish();
  
  hitzone[0][1] = y-50;
  hitzone[1][1] = y+75;
  }
  else {
  reset();
  }
  
 
}

public void replenish() {
if(x<-150) {
x = 1700;
y = (int)(Math.random() * 400 + 200);
}
}

public void detect(Bird b) {
  if(x>hitzone[0][0] && x<hitzone[1][0]) {
    if(b.getY()<hitzone[0][1] || b.getY()>hitzone[1][1]) {
      end = true;
    }
    else if(Math.abs(x-hitzone[0][0]) <= score/2 + 7) {
      score++;
    }
  }
}

public void reset() {
  x=1700;
  y = (int)(Math.random() * 400 + 200);
}

}
