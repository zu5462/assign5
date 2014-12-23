class Ball{
  
  float size;
  float Xspeed;
  float Yspeed;
  float x;
  float y;
void mousemove(){
  x=mouseX;
  y=mouseY;
}
void move(){ 
  x+=Xspeed;
  y+=Yspeed;
  if( x<0 || x+size/2>=width){
    Xspeed=-Xspeed;
    }
  if(y<0){
    Yspeed=-Yspeed;
    }
  if(y+size/2>=height+30){
    life-=1;
    reset();
    }
  }
 
 
void display(){
  noStroke();
  fill(255);
  ellipse(x,y,size,size);
}

void bounce(){
    float bottom = y+size/2;
    float bartop = mybar.y-mybar.thick/2;
    float barbottom = mybar.y+mybar.thick/2;
    float bLeft = mybar.x-mybar.length/2;
    float bRight = mybar.x+mybar.length/2;
  if(bottom >= bartop && barbottom>bottom && x>=bLeft*0.95 && x<=bRight*1.05){
      Yspeed=-Yspeed;
      y = bartop-size/2;
  }
}

void balliX(){
  if(start==false){
    x=mouseX;
    if(mouseX>=width-mybar.length/2){
      x=width-mybar.length/2;
    }
    if(mouseX<=mybar.length/2){
      x=mybar.length/2;
    }
  }
}
  

Ball(float size){
  x=mouseX;
  y=mybar.y-size;
  Xspeed=0;
  Yspeed=0;
  this.size=size;
  }

}
