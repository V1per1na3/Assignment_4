void reset(){
  Collect=false;
  Lose=false;
  isHolding=false;
  coin= new Coin();
  wave= new Wave();
  farmer= new Farmer();
  goUp=false;
  goLeft=false;
  goRight=false;
  gamestart=false;
  win=loadImage("win.png");
  loss=loadImage("loss.png");
  begin=loadImage("begin.png");
  buttonX= width/2;//button x position
  buttonY= height/2;//button y position
  buttonWidth=50;//button width
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
