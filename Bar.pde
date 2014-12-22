class Bar{
  float x;
  float y;
  float length;
  float thick;
 
void display(){
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(x,y,length,thick);
}

void move(){
  x=mouseX;
  if(mouseX>=width-length/2){
    x=width-length/2;
  }
  if(mouseX<=length/2){
    x=length/2;
  }
}
  
Bar(float length){
  y=height-20;
  this.length=length;
  thick=10;
}
}
