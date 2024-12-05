Farmer farmer;
Platform1[] platform1= new Platform1[2];
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
  size(400,550);
  imageMode(CENTER);
  rectMode(CENTER);
  isHolding=false;
  farmer= new Farmer();
  goUp=false;
  goLeft=false;
  goRight=false;
  holdStart=0;//start time
  holdTimer=0;//store hold space time
  holdMaxTime=2000;//max time to hold space bar in ms
  //initialize platform1
  for (int i=0;i< platform1.length; i++){
    platform1[i] = new Platform1();
  }    
}

void draw(){
  background(255);
  Landed=false;
  farmer.display();
  farmer.Timer();
  farmer.movement();
  farmer.checkEdges();
  for (int i=0;i< platform1.length; i++){
    platform1[i].display();//show platform
    platform1[i].collision(farmer);//collision with farmer
  } 
  //println(farmer.FarmerLoc.y);//debug purposes
  //println(farmer.left);
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
    if(!isHolding){
      isHolding=true;//start to record
      isJumping=true;//start jumping anim
      holdStart=millis();//record time
    }
  }
}

void keyReleased(){
  if (key==' '){
    //stop holding if space bar is being hold
    if (isHolding){
     isHolding=false;
     farmer.Jump();//jump
     holdTimer=0;//reset holdtime when released
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
