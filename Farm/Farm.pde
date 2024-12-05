Farmer farmer;
boolean isWalking;
boolean isJumping;
boolean goUp;
boolean goLeft;
boolean goRight;
boolean Landed;
boolean isHolding;
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
}
void draw(){
  background(255);
  farmer.display();
  farmer.ADmovement();
  farmer.Jump();
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
    isHolding=true;//start to record
    isJumping=true;
  }
}

void keyReleased(){
  if (key==' '){
    isHolding=false;//stop recording
    goUp=true;
    isJumping=false;//play jumping anim
  }else if (key=='a'){
    goLeft=false;
    isWalking=false;
  }else if (key=='d'){
    goRight=false;
    isWalking=false;
  }
}
