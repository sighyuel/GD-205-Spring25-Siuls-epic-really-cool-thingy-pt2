void setup(){
  size(666,666);
  background(#000000);
}

void draw(){
  
  println(mouseY);
    if( mouseX < 333 && mouseY > 333){
    background(#00ff00);
  } else {
    background(#000000);
  }
}

void mouseClicked(){
}
