class Platform3{
  PVector Platform3Loc;
  //variable for calculate hitbox
  float w;
  float h;  
  float left;
  float right;
  float top;
  float bottom;
  
  Platform3(){
    Platform3Loc= new PVector (random(120,280),random(100,200));
    w=50;
    h=20;
    //calculate the hitbox 
    left=Platform3Loc.x-w/2;
    right=Platform3Loc.x+w/2;
    top=Platform3Loc.y-h/2;
    bottom=Platform3Loc.y+h/2;
  }
  
  void display(){
    fill(240);
    rect(Platform3Loc.x,Platform3Loc.y, w,h);
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
      }else if (farmer.right>left && farmer.FarmerLoc.x< Platform3Loc.x){
        farmer.FarmerLoc.x= left-farmer.w/2;//right of farmer = left of platform
        //if left && collide
      }else if (farmer.left < right && farmer.FarmerLoc.x > Platform3Loc.x){
        farmer.FarmerLoc.x= right +farmer.w/2;//left of farmer = right of platform
      }
    }
  }
}
