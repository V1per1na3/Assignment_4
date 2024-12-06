Farmer farmer;
Wave wave;
Coin coin;
Platform1[] platform1= new Platform1[2];
Platform2[] platform2= new Platform2[3];
Platform3[] platform3= new Platform3[2];
boolean isWalking;
boolean isJumping;
boolean goUp;
boolean goLeft;
boolean goRight;
boolean Landed;
boolean isHolding;
boolean Lose;
boolean Collect;
float holdStart;
float holdTimer;
float holdMaxTime;
int dir =1;

void setup(){
  size(400,550);
  imageMode(CENTER);
  rectMode(CENTER);
  Collect=false;
  Lose=false;
  isHolding=false;
  coin= new Coin();
  wave= new Wave();
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
  //initialize platform2
  for (int i=0;i< platform2.length; i++){
    platform2[i] = new Platform2();
  }
  //initialize platform3
  for (int i=0;i< platform3.length; i++){
    platform3[i] = new Platform3();
  } 
}

void draw(){
  background(255);
  Landed=false;//always apply gravity each frame & only not apply when landed is true
  farmer.display();
  farmer.Timer();
  farmer.movement();
  farmer.checkEdges();
  //call function for platforms
  for (int i=0;i< platform1.length; i++){
    platform1[i].display();//show platform
    platform1[i].collision(farmer);//collision with farmer
  } 
  for (int i=0;i< platform2.length; i++){
    platform2[i].display();//show platform
    platform2[i].collision(farmer);//collision with farmer
  } 
  for (int i=0;i< platform3.length; i++){
    platform3[i].display();//show platform
    platform3[i].collision(farmer);//collision with farmer
  }
  coin.display();
  coin.collision(farmer);
  //put in the end so wave covers everything 
  wave.display();
  wave.movement();
  wave.collision(farmer);
  //println(farmer.FarmerLoc.y);//debug purposes
  //println(farmer.left);
  //println(Collect);
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
