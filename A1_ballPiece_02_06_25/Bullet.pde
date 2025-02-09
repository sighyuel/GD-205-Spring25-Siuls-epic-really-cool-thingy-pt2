public class Bullet {

  Target elon;
  PVector posB;
  PVector speed;
  color c;
  int size;
  boolean ShouldBreakBullet;
  float rightB;
  float leftB;

  // constructor for the bullets
  Bullet(float x, float y, String type) {
    posB = new PVector(x, y);

    // doesnt break bullet automatically
    ShouldBreakBullet = false;

    // puts all the bullets for specific colours and sizes and speeds depending on the size
    switch(type) {
    case "slow":
      speed = new PVector(0.75, 0.0);
      c = #0000FF;
      size = 60;
      break;
    case "medi":
      speed = new PVector(1.5, 0.0);
      c = #ff0000;
      size = 30;
      break;
    default:
      speed = new PVector(3.0, 0.0);
      c = #00ff00;
      size = 15;
      break;
    }
    rightB = posB.x + size/2.0;
    leftB = posB.x - size/2.0;
  }

  // displays the bullet themselves
  void display() {
    fill(c);
    noStroke();
    circle(posB.x, posB.y, size);
  }

  // adds bullet travel
  void update() {
    posB.add(speed);
    fill(#00ff00, 32);
    rightB = posB.x-100 + size/2.0;
    leftB = posB.x-100 - size/2.0;
  }


  // break bullet when leaving canvas
  void Break() {
    if (posB.x == width) {
      ShouldBreakBullet = true;
    }
  }
}
