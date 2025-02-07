class Target{
  
  PVector hurtBoxPos;
  PVector pos;
  PImage normalState, hitState;
  int hurtRadius;
  
  // constructor for Elon's body
  Target(float x, float y, String Target){
    hurtRadius = 215;
    hurtBoxPos = new PVector(620.0, 400.0);
    normalState = loadImage("Target.png");
    hitState = loadImage("Target2.png");
    pos = new PVector(x, y);
    switch(Target){
      case "hitState":
        image(hitState, x, y);
        break; 
      default:
        image(normalState, x, y);
        break;
         }
  }
    
    void display(){
      // unshot elon :(
      pushMatrix();
      noFill();
      image(normalState, pos.x, pos.y);
      circle(hurtBoxPos.x, hurtBoxPos.y, hurtRadius*2 );
      popMatrix();
    }
    
    // shot elon :)
    void update(){
      tint(#EA6F6F); 
      image(hitState, pos.x, pos.y);
      noTint();
      
    } 
}
