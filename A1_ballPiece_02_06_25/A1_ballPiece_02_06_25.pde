/*
I want to make a gun that shoots three different colour pellets depending on which
 button is pressed. Depending on the colour of the bullet the speed will vary.
 */
Target e; // Target Class
ArrayList <Bullet> b; //  Bullet Class and allows for multiple bullets to appear at once

PImage Tool;
float hor = width/2.0;
int chargeTime = millis();
PVector imagePos;


void setup() {
  size(666, 666);
  background(255);
  imagePos = new PVector(555.0, 400.0);
  e = new Target(imagePos.x, imagePos.y, "Target");
  b = new ArrayList <Bullet>();
  Tool = loadImage("tool.png"); // brings in the gun
}

void draw() {
  background(255);
  image(Tool, mouseX - 75, mouseY + 35); // gun tip is on the cursor
  imageMode(CENTER);
  e.display();
  // Allows us to cycle through and display every bullet in the Arraylist
  for (Bullet Ball : b) {
    Ball.update();
    Ball.display();
    Ball.bodyShot(e);
  }
  /* Removes unnecessary bullets for game optimitzation doesnt blow up computer
  starts counting the ArrayList from largest index to smallest instead
  */
  for(int i = b.size()-1; i >=0; i--){
    Bullet ball = b.get(i); // creating variable
   
    
    if(ball.ShouldBreakBullet == true){
      b.remove(ball);
    }
  }
}


void mousePressed() {
  chargeTime = millis(); // shows how long the mouse button is pressed for each bullet type
}

void mouseReleased() {
  chargeTime = millis() - chargeTime;
  println("chargeTime", chargeTime);
  int slowCharge = 1000; // need to hold m1 for 1 second for big charge
  int mediCharge = 500; // need to hold m1 for 0.5 seconds for medium charge

  if (chargeTime > slowCharge) {
    b.add (new Bullet(mouseX, mouseY, "slow"));
  } else if (chargeTime > mediCharge) {
    b.add (new Bullet(mouseX, mouseY, "medi"));
  } else {
    b.add (new Bullet(mouseX, mouseY, "fast"));
  }
}
