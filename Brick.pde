class Brick{
  int thick;
  int length;
  int ix=70;
  int iy=50;
  int col;
  int r;
  int g;
  int b;
  int xspacing;
  int yspacing;
  boolean behit=false;
  int x;
  int y;
  
 void display(int i,int col){
    if(behit==false){
    rectMode(CENTER);
    fill(r,g,b);
    noStroke();
    rect(int(ix+xspacing*(i%col)),int(iy+yspacing*(i/col)),length,thick);
    x=int(ix+xspacing*(i%col));
    y=int(iy+yspacing*(i/col));
    }
  }
  
void hitbrick(){
  float top       =y-thick/2;
  float bottom    =y+thick/2;
  float left      =x-length/2;
  float right     =x+length/2;
  float rightdis  =dist(ball.x,ball.y,right,y);
  float leftdis   =dist(ball.x,ball.y,left,y);  
  float topdis    =dist(ball.x,ball.y,x,top);
  float bottomdis =dist(ball.x,ball.y,x,bottom);
  if(behit !=true){
  if(ball.y<bottom   && ball.y>top 
     && ball.x<right && ball.x>left){
     removebrick();
     hit++;
     if((rightdis < topdis && rightdis < bottomdis && rightdis < leftdis)||
        (leftdis < topdis  && leftdis  < bottomdis && leftdis  < rightdis)){
        ball.Xspeed=-ball.Xspeed;
        }else{
        ball.Yspeed=-ball.Yspeed;
        }
          if(bricks[b1].behit==true
          || bricks[b2].behit==true
          || bricks[b3].behit==true){
             mybar=new Bar(150);
          }else if(bricks[r1].behit==true
          || bricks[r2].behit==true
          || bricks[r3].behit==true){
               mybar=new Bar(50);
            }
      }
    }
  }

void removebrick(){
  x=1000;
  y=1000;
  behit=true;
}


Brick(int r,int g, int b){
    thick=30;
    length=30;
    xspacing=15+length;
    yspacing=15+thick;
    this.r=r;
    this.g=g;
    this.b=b;
  }
}
