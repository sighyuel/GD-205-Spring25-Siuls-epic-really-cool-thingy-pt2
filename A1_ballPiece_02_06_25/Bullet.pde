public class Bullet{
  
  Target elon;
  PVector pos;
  PVector speed;
  color c;
  int size;
  boolean ShouldBreakBullet;
  float right;
  float left;
  
  // constructor for the bullets
  Bullet(float x, float y, String type){
    pos = new PVector(x, y);
    
    // doesnt break bullet automatically
    ShouldBreakBullet = false;
    
    // puts all the bullets for specific colours and sizes and speeds depending on the size
    switch(type){
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
    right = pos.x + size/2.0;
    left = pos.x - size/2.0; 
  }
  
  // displays the bullet themselves
  void display(){
    fill(c);
    noStroke();
    circle(pos.x, pos.y, size);
  }
  
   // adds bullet travel
  void update(){
    pos.add(speed);
    fill(#00ff00, 32);
    right = pos.x-100 + size/2.0;
    left = pos.x-100 - size/2.0;
    
  }
  
  // head collisions
  void headShot(Target elon){
      if (size/2 + elon.hurtRadius > pos.dist(e.headBoxPos)){
    e.update();
  } else {
    e.display();
  }
  }
  
  // body collisions
  void bodyShot(Target elon){
    if ( left <= elon.right &&
        right >= elon.left){
          elon.update();
    } else {
      elon.display();
    }
  }
  
  // break bullet when leaving canvas
  void Break(){  
    if(pos.x == width){
      ShouldBreakBullet = true;
    }   
  }
}

  
  
