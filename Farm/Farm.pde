Farmer farmer;
boolean isWalking;
boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;
int dir =1;
void setup(){
  size(750,500);
  imageMode(CENTER);
  farmer= new Farmer();
  goUp=false;
  goDown=false;
  goLeft=false;
  goRight=false;
}
void draw(){
  background(255);
  farmer.display();
  //farmer.movement();
  farmer.checkEdges();
}

void keyPressed(){
  isWalking =true;
  if(key=='d'){
    dir=1;
  }
  if(key=='a'){
    dir=-1;
  }
}

void keyReleased(){
  isWalking= false;
}
