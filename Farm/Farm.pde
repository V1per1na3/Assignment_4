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
  farmer.movement();
  farmer.checkEdges();
}

void keyPressed(){
  isWalking=true;
  if (key=='w'){
    goUp=true;
    dir=1;
  }else if (key=='s'){
    goDown=true;
    dir=-1;
  }else if (key=='a'){
    goLeft=true;
    dir=-1;
  }else if (key=='d'){
    goRight=true;
    dir=1;
  }
}

void keyReleased(){
  isWalking=false;
  if (key=='w'){
    goUp=false;
  }else if (key=='s'){
    goDown=false;
  }else if (key=='a'){
    goLeft=false;
  }else if (key=='d'){
    goRight=false;
  }
}
