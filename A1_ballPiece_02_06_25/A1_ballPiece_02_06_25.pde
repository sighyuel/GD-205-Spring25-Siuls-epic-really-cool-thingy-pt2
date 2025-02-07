/*
I want to make a gun that shoots three different colour pellets depending on which 
button is pressed. Depending on the colour of the bullet the speed will vary.
*/
Target e; // Target Class
Bullet b; //  Bullet Class

PImage Tool;
float hor = width/2.0;
int chargeTime = millis();
PVector imagePos;


void setup(){
  size(666, 666);
  background(255);
  imagePos = new PVector(555.0, 400.0);
  e = new Target(imagePos.x, imagePos.y, "Target"); 
  b = new Bullet(99999, 99999, "type"); // original bullet shows offscreen 
  Tool = loadImage("tool.png"); // brings in the gun
}

void draw(){
  background(255);
  image(Tool, mouseX - 75, mouseY + 35); // gun tip is on the cursor
  b.update(); // makes bullet travel
  b.display(); // makes bullet spawn
  imageMode(CENTER);
  
  // collision detection
  if (b.size/2 + e.hurtRadius > b.pos.dist(e.hurtBoxPos)){
    e.update();
  } else {
    e.display();
  }
  
}

void mousePressed(){
  chargeTime = millis(); // shows how long the mouse button is pressed for each bullet type
}

void mouseReleased(){
  chargeTime = millis() - chargeTime;
  println("chargeTime", chargeTime);
  int slowCharge = 1000; // need to hold m1 for 1 second for big charge
  int mediCharge = 500; // need to hold m1 for 0.5 seconds for medium charge
  
  if(chargeTime > slowCharge){
    b = new Bullet(mouseX, mouseY, "slow");
  } else if(chargeTime > mediCharge){
    b = new Bullet(mouseX, mouseY, "medi");
  } else {
    b = new Bullet(mouseX, mouseY, "fast");
  }
}
