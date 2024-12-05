class Platform2{
  PVector Platform2Loc;
  //variable for calculate hitbox
  float w;
  float h;  
  float left;
  float right;
  float top;
  float bottom;
  
  Platform2(){
    Platform2Loc= new PVector (random(100,300),random(210,360));
    w=70;
    h=20;
    //calculate the hitbox 
    left=Platform2Loc.x-w/2;
    right=Platform2Loc.x+w/2;
    top=Platform2Loc.y-h/2;
    bottom=Platform2Loc.y+h/2;
  }
  
  void display(){
    fill(180);
    rect(Platform2Loc.x,Platform2Loc.y, w,h);
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
      }else if (farmer.right>left && farmer.FarmerLoc.x< Platform2Loc.x){
        farmer.FarmerLoc.x= left-farmer.w/2;//right of farmer = left of platform
        //if left && collide
      }else if (farmer.left < right && farmer.FarmerLoc.x > Platform2Loc.x){
        farmer.FarmerLoc.x= right +farmer.w/2;//left of farmer = right of platform
      }
    }
  }
}
