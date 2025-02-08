public class Target{
  
  PVector bodyBoxPos;
  PVector bodyBoxArea;
  PVector headBoxPos;
  PVector pos;
  PImage normalState, hitState;
  int hurtRadius;
  float right;
  float left;
  boolean pleaseDie;
  
  // constructor for Elon's body
  Target(float x, float y, String Target){
    hurtRadius = 40;
    bodyBoxPos = new PVector(470.0, 225.0);
    bodyBoxArea = new PVector(175.0, 425.0);
    headBoxPos = new PVector(555.0, 190.0);
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
    right = bodyBoxPos.x + bodyBoxArea.x/2;
    left = bodyBoxPos.x - bodyBoxArea.x/2;
    pleaseDie = false;
  }
    
    void display(){
      // unshot elon :(
      pushMatrix();
      noStroke();
      noFill();
      image(normalState, pos.x, pos.y);
      circle(headBoxPos.x, headBoxPos.y, hurtRadius*2 );
      rect(bodyBoxPos.x, bodyBoxPos.y, bodyBoxArea.x, bodyBoxArea.y);
      popMatrix();
    }
    
    // shot elon :)
    void update(){
      tint(#EA6F6F); 
      image(hitState, pos.x, pos.y);
      noTint();
      
    } 
}
