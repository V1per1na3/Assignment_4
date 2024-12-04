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
  
  Farmer(){
    farmerspeed =1.5;//moving speed
    FarmerLoc = new PVector (width/2, height/2);//initial location
    FarmerVelo= new PVector (0,0);
    Farmergrav = new PVector (0,0.5);//downward force in y axis
    FarmerAcc= new PVector (0,-10);//upward force in y axis
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
    if(goUp && Landed){
      FarmerVelo.add(FarmerAcc);//add acc if player is jumping *going up
      Landed=false;
    }
    FarmerLoc.add(FarmerVelo);//update position\
    if(FarmerLoc.y >=height/2){
      Landed=true;
      FarmerLoc.y= height/2;
      FarmerVelo.y=0;
    }
    if(goLeft){
      FarmerLoc.x -=farmerspeed;
    }
    if(goRight){
      FarmerLoc.x +=farmerspeed;
    }
  } 
  void checkEdges(){
     //constrain farmer within the canvas 
     if (FarmerLoc.x>=width-20){
       FarmerLoc.x= width-20;
     }else if (FarmerLoc.x <=20){
       FarmerLoc.x=20;
     }
     if (FarmerLoc.y>=height-25){
       FarmerLoc.y= height-25;
     }else if (FarmerLoc.y <=25){
       FarmerLoc.y=25;
     }
  }
}
    
