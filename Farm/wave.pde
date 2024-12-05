class Wave{
  float Wavey;
  float Wavespeed;
  float perlinT;
  
  Wave(){
    Wavey=height;//initial y position
    Wavespeed=0.3;
    perlinT=0;
  }
  
  void display(){
    //draw wave
    noStroke();
    fill(#86bfbe);
    beginShape();
    //loop to generate vertices along x-axis
    for (float x=0; x<=width; x+=20){
      float y = Wavey +20 * noise(perlinT+x*0.01);
      vertex(x,y);
    }
    vertex(width,height);
    vertex(0,height);
    endShape(CLOSE);
    perlinT += 0.03;
  }
  
  void movement(){
    //wave raises along y-axis
    Wavey -= Wavespeed;
  }
}
  
    
