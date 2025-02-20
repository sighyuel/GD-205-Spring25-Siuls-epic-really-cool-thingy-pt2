PVector speed;
PVector size;


void setup(){
  size(666,666);
  speed = new PVector(-2.0, 0.0);
  size = new PVector(111.0, 111.0);
}

void draw(){
  background(255);
  
  rect(size.x, size.y, 50, 50);
  
}

void keyPressed(){
  if(key == 'a'){
    size.add(speed);
  }
}
