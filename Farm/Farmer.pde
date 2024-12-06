class Farmer{
  PVector FarmerLoc;
  PVector FarmerVelo;
  PVector Farmergrav;
  PVector FarmerAcc;
  PImage farmerStand[];
  PImage farmerJump[];
  PImage farmerWalk[];
  int farmerJumpFrame;
  int farmerStandFrame;
  int farmerWalkFrame;
  float farmerspeed;
  float maxAcc;
  float w=28;//the size of character image
  float h=44;
  float left;//hitbox value
  float right;
  float top;
  float bottom;
  
  Farmer(){
    maxAcc=-13;//max acc
    farmerspeed =2;//moving speed
    FarmerLoc = new PVector (width/2, height-50);//initial location
    FarmerVelo= new PVector (0,0);
    Farmergrav = new PVector (0,0.5);//downward force in y axis
    FarmerAcc= new PVector (0,-5);//upward force in y axis
    farmerJump= new PImage[3];
    //loop through the jumping poses
    for (int i=0; i<farmerJump.length; i++){
      farmerJump[i]=loadImage("character_jump"+i+".png");
    }
    farmerStand = new PImage[4];
    //loop through the standing poses
    for (int i=0; i<farmerStand.length; i++){
      farmerStand[i]=loadImage("character_stand"+i+".png");
    }
    farmerWalk = new PImage[6];
    //loop through the walking poses
    for (int i=0; i< farmerWalk.length; i++){
      farmerWalk[i]=loadImage("character_walk"+i+".png");
    }
  }
  
  void display(){
    pushMatrix();
    translate(FarmerLoc.x,FarmerLoc.y);
    scale(dir,1);
    if (frameCount%10 ==0){
      farmerStandFrame = (farmerStandFrame+1)% farmerStand.length;
    }
    if (frameCount%5 ==0){
      farmerWalkFrame = (farmerWalkFrame+1)% farmerWalk.length;
    }
    if (frameCount%10 ==0){
      farmerJumpFrame = (farmerJumpFrame+1)% farmerJump.length;
    }
    if( isWalking ==true){
      image(farmerWalk[farmerWalkFrame],0,0);
    }else if( isJumping ==true){
      image(farmerJump[farmerJumpFrame],0,0);
    }else{
      image(farmerStand[farmerStandFrame],0,0);
    }
    popMatrix();
  }
  
  void movement(){ 
    if(!Landed){
      FarmerVelo.add(Farmergrav);//add gravity if player is in the air *going down
    }
    FarmerLoc.add(FarmerVelo);//update location by adding velo back to position
    //calculate hitbox here bc farmer will be moving around 
    left=FarmerLoc.x-w/2;
    right=FarmerLoc.x+w/2;
    top=FarmerLoc.y-h/2;
    bottom=FarmerLoc.y+h/2;
    //check if farmer is landed, if so stop the downward force
    if(FarmerLoc.y >=height-50){
      Landed=true;
      FarmerLoc.y= height-50;//fall back to where we begin
      FarmerVelo.y=0;//stop downward force
    }
    if(goLeft){
      FarmerLoc.x -=farmerspeed;//going left
    }
    if(goRight){
      FarmerLoc.x +=farmerspeed;//going right
    }
  }
  
  void Timer(){
    if(isHolding){
      //calculate holding duration by - holdtime to current time
      holdTimer=millis()-holdStart;
      //use map to get relative acc base on hold duration
      FarmerAcc.y=map(holdTimer,0,holdMaxTime,-5,maxAcc);
      //turns out map does not constrain acc like I thought it would
      //adding actual constrain to acc fixed the problem!
      FarmerAcc.y=constrain(FarmerAcc.y, maxAcc, -5);
    }
  }
      
  void Jump(){
    if(Landed){
      FarmerVelo.add(FarmerAcc);//add acc if player is trying to jumping *going up
      Landed=false;
      FarmerAcc.y=0;//reset acc after jump
    }
  }
  
  void checkEdges(){
    //constrain farmer within the canvas 
    if (FarmerLoc.x>=width-20){
      FarmerLoc.x= width-20;
    }else if (FarmerLoc.x <=20){
      FarmerLoc.x=20;
    }
  }
}
    
