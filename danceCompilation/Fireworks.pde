void drawFireworks() {
   background(0);
   level = amp.analyze();
   genRate = (int) (level*100);

  //new burst every x frames
   if(genRate > 50)
     bursts.add(new Burst());
   else if(genRate > 30 && genRate < 50 && frameCount % 2 == 0)
     bursts.add(new Burst());
   else if(genRate > 5 && genRate < 30 && frameCount % 5 == 0) {
     bursts.add(new Burst());
     bursts.add(new Burst());
   }
   else if(frameCount % 10 == 0)
       bursts.add(new Burst());
     
   
   //removes bursts from lsit
   for(int i = bursts.size()-1; i > 0; i--){
     if(bursts.get(i).alive == false)
       bursts.remove(i);
   }
   //shows bursts  
   for(Burst b : bursts)
      b.showBursts();
}

class Burst
{
  float hue;
  float burstOriginX;
  float burstOriginY;
  ArrayList<Particle> particles;
  float burstRadius;
  boolean alive = true;
  
  Burst (){
    if(currentColor > 30 && currentColor < 80)
     currentColor = 80;
    else if(currentColor > 100)
      currentColor = 0;
    currentColor = currentColor+2;
    burstOriginX = random(0, width);
    burstOriginY = random(0, 4*height/5);
    this.burstRadius = random(100, 200);
    this.hue = currentColor;
   // this.hue = random(0, 100);
    //create particles for each burst
    particles = new ArrayList<Particle>();
    for(int i = 0; i < 20; i++)
      particles.add(new Particle(burstOriginX, burstOriginY, hue));
  }
  void showBursts(){
     for(Particle p : particles) {
       p.display();
     }
    
     for(int i = particles.size()-1; i>=0; i--){
        if(dist(particles.get(i).position.x, particles.get(i).position.y, burstOriginX, burstOriginY) > burstRadius)
          particles.remove(i); 
     }
     
     if(particles.size() < 1)
       alive = false;
     
 }
}
class Particle
{
  PVector position;
  PVector velocity = PVector.random2D();
  ArrayList<PVector> previousPos;
  float brightness = 100;
  float thisHue;
  
  Particle (float burstOriginX, float burstOriginY, float hue){
    velocity.setMag(random(2, 5));
    this.position = new PVector(burstOriginX, burstOriginY);
    this.velocity = velocity.copy();
    previousPos = new ArrayList<PVector>();
  //  fill(hue, 100, brightness);
    this.thisHue = hue;
  }
  
  void display(){
    fill(thisHue, 100, brightness);
    ellipse(position.x, position.y, d, d);
    previousPos.add(position.copy());
   // println(previousPos.size());
     
    //acceleration
    PVector acceleration = new PVector(position.x, height);
    acceleration.sub(position);
    float m = acceleration.mag();
    acceleration.mult(10000/m/m/m);
    velocity.add(acceleration);
    
    position.add(velocity);
    for(int i = 0; i < previousPos.size(); i++){
      noStroke();
      brightness = 2*i;
      fill(thisHue, 100, brightness);
      ellipse(previousPos.get(i).x, previousPos.get(i).y, d, d);
      if(i < previousPos.size()-1)
        d = d+0.1;
      else
        d = 1;
       }
    
    }
  
}
