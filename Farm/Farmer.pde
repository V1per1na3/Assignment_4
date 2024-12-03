class Farmer{
  PVector FarmerLoc;
  PImage farmerStand[];
  PImage farmerWalk[];
  int farmerStandFrame;
  int farmerWalkFrame;
  
  Farmer(){
    FarmerLoc = new PVector (width/2, height/2);
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
    if (frameCount%7 ==0){
      farmerWalkFrame = (farmerWalkFrame+1)% farmerWalk.length;
    }
    if( isWalking ==true){
      image(farmerWalk[farmerWalkFrame],0,0);
    }else{
      image(farmerStand[farmerStandFrame],0,0);
    }
    popMatrix();
  }
  //void movment(){
  //}
  void checkEdges(){
     //constrain farmer within the canvas 
     if (FarmerLoc.x>=width){
       FarmerLoc.x= width;
     }else if (FarmerLoc.x <=0){
       FarmerLoc.x=0;
     }
     if (FarmerLoc.y>=height){
       FarmerLoc.y= height;
     }else if (FarmerLoc.y <=0){
       FarmerLoc.y=0;
     }
  }
}
    
