Farmer farmer;
boolean isWalking;
boolean isJumping;
boolean goUp;
boolean goLeft;
boolean goRight;
boolean Landed;
int dir =1;
void setup(){
  size(750,500);
  imageMode(CENTER);
  farmer= new Farmer();
  Landed=true;
  goUp=false;
  goLeft=false;
  goRight=false;
}
void draw(){
  background(255);
  farmer.display();
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
  }else if (key == ' '&& Landed){
    goUp=true;
    isJumping=true;
  }
}

void keyReleased(){
  if (key==' '){
    goUp=false;
    isJumping=false;
  }else if (key=='a'){
    goLeft=false;
    isWalking=false;
  }else if (key=='d'){
    goRight=false;
    isWalking=false;
  }
}
