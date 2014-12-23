Ball ball;
Bar mybar;
Brick[] bricks;
Brick[] blue;
Brick[] red;

int life=3;
int hit=0;
boolean start=false;

final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_LOSE=2;
final int GAME_WIN=3;
int gameState;

int bar=100;
int b1=int(random(60));
int b2=int(random(60));
int b3=int(random(60));
int r1=int(random(60));
int r2=int(random(60));
int r3=int(random(60));

boolean hitsp=false;
boolean hitr=false;
boolean hitb=false;

void setup(){
  size(640,480);
  mybar= new Bar(bar);
  ball=new Ball(10);
  bricks=new Brick[60];
for(int a=0; a<bricks.length;a++){
  if(a!=b1 && a!=b2 && a!=b3 && a!=r1 && a!=r2 && a!=r3){
  bricks[a]=new Brick(3*a,255,3*a);
    }
}
  bricks[b1]=new Brick(100,100,255);
  bricks[b2]=new Brick(100,100,255);
  bricks[b3]=new Brick(100,100,255);
  bricks[r1]=new Brick(255,100,100);
  bricks[r2]=new Brick(255,100,100);
  bricks[r3]=new Brick(255,100,100);
}
void draw(){
  switch(gameState){
    case GAME_START:
      background(0);
      textSize(20);
      text("Press ENTER To Start",200,int(height/2));
      text("BREAKOUT",200,int(height/2-40));
      break;
      
    case GAME_RUN:
      background(0);
      ball.balliX();
      ball.mousemove();
      ball.display();
      ball.bounce();
      mybar.display();
      mybar.move();
      for(int a=0; a<bricks.length;a++){
      if(a!=b1 && a!=b2 && a!=b3 && a!=r1 && a!=r2 && a!=r3){
      bricks[a].display(a,12);
      bricks[a].hitbrick();
        }
      }
      hitblue();
      hitred();
      drawlife();
      checkState();
      break;
      
      case GAME_LOSE:
      fill(255);
      text("YOU ARE LOSE!!",200,int(height/2+50));
      text("Press ENTER To Reset",200,int(height/2+80));
      break;
      
    case GAME_WIN:
      text("YOU ARE WIN!!",200,int(height/2+50));
      text("Press ENTER To Reset",200,int(height/2+80));
      break;
      
  }
}

void keyPressed(){
  if(key==ENTER){
  switch(gameState){
    case GAME_START:
      gameState=GAME_RUN;
      break;
    case GAME_LOSE:
      reset();
      gameState=GAME_RUN;
      break;
   case GAME_WIN:
      reset();
      gameState=GAME_RUN;
      break;
   }
  }
}

void mouseClicked(){
  if(mouseButton==LEFT && start==false && gameState==GAME_RUN){
    start=true;
    ball.Xspeed=random(-4,4);
    ball.Yspeed=-6;
    }
  } 
  
void hitblue(){
  bricks[b1].display(b1,12);
  bricks[b1].hitbrick();
  bricks[b2].display(b2,12);
  bricks[b2].hitbrick();  
  bricks[b3].display(b3,12);
  bricks[b3].hitbrick();
  barp();
}

void hitred(){
  bricks[r1].display(r1,12);
  bricks[r1].hitbrick();
  bricks[r2].display(r2,12);
  bricks[r2].hitbrick();  
  bricks[r3].display(r3,12);
  bricks[r3].hitbrick();
  barm();
}

void barp(){
   if(bricks[b1].behit==true && bricks[b1].spbehit==false){
    mybar.length=150;
    bricks[b1].spbehit=true;
  }else if(bricks[b2].behit==true && bricks[b2].spbehit==false){
    mybar.length=150;
    bricks[b2].spbehit=true;
  }else if(bricks[b3].behit==true && bricks[b3].spbehit==false){
    mybar.length=150;
    bricks[b3].spbehit=true;  
  }
}

void barm(){
  if(bricks[r1].behit==true && bricks[r1].spbehit==false){
    mybar.length=50;
    bricks[r1].spbehit=true;
  }else if(bricks[r2].behit==true && bricks[r2].spbehit==false){
    mybar.length=50;
    bricks[r2].spbehit=true;
  }else if(bricks[r3].behit==true && bricks[r3].spbehit==false){
    mybar.length=50;
    bricks[r3].spbehit=true;
  }
}

void drawlife(){
  textSize(20);
  text("LIFE:",10,height-30);
  for(int i=0;i<life;i++){
  ellipse(70+i*20,height-37,13,13);
  }
}

void checkState(){
  if(hit>=bricks.length){
    gameState=GAME_WIN;
  }else if(life==0){
    gameState=GAME_LOSE;
  }
}

void reset(){
  start=false;
  ball=new Ball(10);
  mybar=new Bar(100);
  if(gameState==GAME_LOSE || gameState==GAME_WIN){
    life=3;
    hit=0;
    b1=int(random(60));
    b2=int(random(60));
    b3=int(random(60));
    r1=int(random(60));
    r2=int(random(60));
    r3=int(random(60));
    for(int a=0; a<bricks.length;a++){
      if(a!=b1 && a!=b2 && a!=b3 && a!=r1 && a!=r2 && a!=r3){
          bricks[a]=new Brick(3*a,255,3*a);
      }
    }
      bricks[b1]=new Brick(100,100,255);
      bricks[b2]=new Brick(100,100,255);
      bricks[b3]=new Brick(100,100,255);
      bricks[r1]=new Brick(255,100,100);
      bricks[r2]=new Brick(255,100,100);
      bricks[r3]=new Brick(255,100,100);
  }
}
