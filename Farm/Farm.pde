Farmer farmer;
boolean isWalking;
boolean isJumping;
boolean goUp;
boolean goLeft;
boolean goRight;
boolean Landed;
boolean isHolding;
float holdStart;
float holdTimer;
float holdMaxTime;
int dir =1;

void setup(){
  size(750,500);
  imageMode(CENTER);
  isHolding=false;
  farmer= new Farmer();
  Landed=true;
  goUp=false;
  goLeft=false;
  goRight=false;
  holdStart=0;
  holdTimer=0;//store hold space time
  holdMaxTime=2000;//max time to hold space bar in ms
}
void draw(){
  background(255);
  farmer.display();
  farmer.Timer();
  farmer.movement();
  farmer.checkEdges();
}

void keyPressed(){
  if (key=='a'){
    goLeft=true;
    dir=-1;
    isWalking=true;
  }else if (key=='d'){
    goRight=true;
    dir=1;
    isWalking=true;
  }else if (key == ' '){
    if(Landed && !isHolding){
      isHolding=true;//start to record
      isJumping=true;//start jumping anim
      holdStart=millis();//record time
    }
  }
}

void keyReleased(){
  if (key==' '){
    if (isHolding){
     isHolding=false;
     farmer.Jump();
     holdTimer=0;
     isJumping=false;
    }
  }else if (key=='a'){
    goLeft=false;
    isWalking=false;
  }else if (key=='d'){
    goRight=false;
    isWalking=false;
  }
}
