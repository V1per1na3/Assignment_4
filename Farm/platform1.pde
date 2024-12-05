class Platform1{
  PVector Platform1Loc;
  
  Platform1(){
    Platform1Loc= new PVector (random(50,350),random(300,450));
  }
  
  void display(){
    fill(0);
    rect(Platform1Loc.x,Platform1Loc.y, 100,20);
  }
}
  
  
    
  
