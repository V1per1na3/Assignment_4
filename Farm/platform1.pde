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
    Platform1Loc= new PVector (random(50,350),random(380,450));
    w=80;
    h=10;
    //calculate the hitbox 
    left=Platform1Loc.x-w/2;
    right=Platform1Loc.x+w/2;
    top=Platform1Loc.y-h/2;
    bottom=Platform1Loc.y+h/2;
  }
  
  void display(){
    fill(100);
    rect(Platform1Loc.x,Platform1Loc.y, w,h,10);
  }
  
  void collision(Farmer farmer){
    //check collision by comparing the hitbox
    if (farmer.right>left&&farmer.left<right&&farmer.bottom>top&& farmer.top<bottom){
      //if up & collide
      if (farmer.FarmerVelo.y >0 && farmer.bottom<=top+10){
        farmer.FarmerLoc.y= top-farmer.h/2;//bottom of farmer = top of platform
        farmer.FarmerVelo.y=0;
        Landed=true;
        //if down & collide
      }else if (farmer.FarmerVelo.y <0 && farmer.top >=bottom-10){
        farmer.FarmerLoc.y =bottom + farmer.h/2;//top of farmer = bottom of platform
        farmer.FarmerVelo.y=0;//stop upward
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
  
  
    
  
