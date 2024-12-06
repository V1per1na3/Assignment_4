class Coin{
  PVector CoinLoc;
  PImage Coins[];
  int coinFrame;
  
  Coin(){
    CoinLoc= new PVector(random(180,230),random(30,80));
    Coins= new PImage [6];
    //loop through the jumping poses
    for (int i=0; i<Coins.length; i++){
      Coins[i]=loadImage("coin"+i+".png");
    }
  }
    
    void display(){
    pushMatrix();
    translate(CoinLoc.x,CoinLoc.y);
    if (frameCount%10 ==0){
      coinFrame = (coinFrame+1)% Coins.length;
    }
    image(Coins[coinFrame],0,0);
    popMatrix();   
  }
}
