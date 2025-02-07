class Bullet{
  
  PVector pos;
  PVector speed;
  color c;
  int size;
  
  // constructor for the bullets
  Bullet(float x, float y, String type){
    pos = new PVector(x, y);
    
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
  }
}
  
  
