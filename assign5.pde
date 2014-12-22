Ball ball;
Bar mybar;
Brick[] bricks;
int life=3;
int hit=0;
boolean start=false;
final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_LOSE=2;
final int GAME_WIN=3;
int gameState;

void setup(){
  size(640,480);
  mybar= new Bar(100);
  ball=new Ball(10);
  bricks=new Brick[60];

for(int i=0; i<bricks.length;i++){
  bricks[i]=new Brick(12,3*i,255,3*i);
}

}

void draw(){
  switch(gameState){
    case GAME_START:
      background(0);
      textSize(20);
      text("Press ENTER To Start",230,height/2);
      text("BREAKOUT",280,height/2-40);
      break;
    case GAME_RUN:
      background(0);
      ball.balliX();
      ball.move();
      ball.display();
      ball.bounce();
      mybar.display();
      mybar.move();
      for(int i=0; i<bricks.length;i++){
      bricks[i].display(i);
      bricks[i].hitbrick();
      }
      drawlife();
      checkState();
      println(hit);
      break;
      case GAME_LOSE:
      textSize(18);
      fill(255);
      text("YOU ARE LOSE!!",250,height/2);
      text("Press ENTER To Reset",230,height/2+30);
      break;
    case GAME_WIN:
      text("YOU ARE WIN!!",250,height/2);
      text("Press ENTER To Reset",230,height/2+30);
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
    ball.Yspeed=-4;
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
  if(gameState==GAME_LOSE || gameState==GAME_WIN){
    life=3;
    hit=0;
    for(int i=0; i<bricks.length;i++){
    int c= int(random(1,4));
    bricks[i]=new Brick(12,3*i,255,3*i);
    }
  }
}
