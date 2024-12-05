class Platform1{
  PVector Platform1Loc;
  //variable for calculate hitbox
  float w;
  float h;  
  float left;
  float right;
  float top;
  float bottom;
  
  Platform1(){
    rectMode(CENTER);
    Platform1Loc= new PVector (random(50,350),random(350,450));
    w=100;
    h=20;
    //calculate the hitbox 
    left=Platform1Loc.x-w/2;
    right=Platform1Loc.x+w/2;
    top=Platform1Loc.y-h/2;
    bottom=Platform1Loc.y+h/2;
  }
  
  void display(){
    fill(0);
    rect(Platform1Loc.x,Platform1Loc.y, w,h);
  }
  
  void collision(Farmer farmer){
    //check collision by comparing the hitbox
    if (farmer.right>left&&farmer.left<right&&farmer.bottom>top&& farmer.top<bottom){
      //if up & collide
      if (farmer.FarmerVelo.y <0 && farmer.top >bottom){
        farmer.FarmerLoc.y =bottom + farmer.h/2;//top of farmer = bottom of platform
        farmer.FarmerVelo.y=0;//stop upward
        Landed=true;
        //if down & collide
      }else if (farmer.FarmerVelo.y >0 && farmer.bottom<top){
        farmer.FarmerLoc.y= top-farmer.h/2;//bottom of farmer = top of platform
        farmer.FarmerVelo.y=0;
        //if right & collide
      }else if (farmer.right>left && farmer.FarmerLoc.x< Platform1Loc.x){
        farmer.FarmerLoc.x= left-farmer.w/2;//right of farmer = left of platform
        //if left && collide
      }else if (farmer.left < right && farmer.FarmerLoc.x > Platform1Loc.x){
        farmer.FarmerLoc.x= right +farmer.w/2;//left of farmer = right of platform
      }
    }
  }
}
  
  
    
  
