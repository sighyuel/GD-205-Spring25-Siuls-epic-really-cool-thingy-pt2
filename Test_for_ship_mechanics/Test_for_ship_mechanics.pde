PVector HoriSpeed, VertSpeed;
PVector size;


void setup(){
  size(666,666);
  VertSpeed = new PVector(0.0, 30.0);
  HoriSpeed = new PVector(75.0, 0.0);
  size = new PVector(10.0, 111.0);
}

void draw(){
  background(255);
  
  rect(size.x, size.y, 50, 50);
  
  if(frameCount % 60 == 0){
    size.add(HoriSpeed);
    println(size.x);
  }
  if(size.x == 610.0){
    size.add(VertSpeed);
  }

}
