void snowSetUp()
{
 /* noStroke();
  noCursor();
  snowParticles = new ArrayList<SnowParticle>(); */
}

void drawSnow()
{
  class Wind
{
  float windPosition;
  float windDirection;
  float level = amp.analyze();
  Wind(float windX) {
    windPosition = windX;
  }
  //if mouse is on left side, all particles get negative acceleration in x direction
  //if mouse is on  right side, all particles get positive acceleration in  x direction
  
  void display(ArrayList<SnowParticle> snowParticles) {
    for (SnowParticle p : snowParticles) {
    
    if(windPosition > width/2)
      windDirection = -0.7;
    else
      windDirection = 0.7;
  /* PVector difference = new PVector(p.position.x - windPosition.x, 
                                      p.position.y - windPosition.y); */
   // float mag = difference.mag();
  //  PVector force = difference.mult(1/mag/mag/mag);
      PVector force = new PVector(level*windDirection, 0);
   // force.mult(800*level);
    
    p.push(force);
    }
  
  }
}
  Wind mouse;
Wind gravity;

int count = 0;
float choice;
int direction;

  colorMode(RGB, 255);
  background(0);
  colorMode(HSB, 360, 100, 100);

  //add sound levels and other variables


  //add new to arraylist
  //generate more than one every frame
  for(int i=0; i<7; i++)
  {
    //declare variables for particles
    PVector position = new PVector(random(0-width/2, 1.5*width), 0);
    PVector velocity = new PVector(random(-0.3, 0.3), random(0, 3));
    color c = color(random(190, 208), random(15,35), 100);
    snowParticles.add(new SnowParticle(position, velocity, c));
  }

  //display particles
  for(SnowParticle p : snowParticles)
  {
    p.display();
  }
  //remove off screne particles
  for (int i = 0; i < snowParticles.size(); i++)
  {
    if (snowParticles.get(i).alive == false)
        snowParticles.remove(i);
  }
  mouse = new Wind(mouseX);
  mouse.display(snowParticles);



  //generate snow for ground, draws 100 circles to represent
 /* if (count < 100)
    for(int i=0; i<100; i++)
     {
      colorMode(RGB, 255);

      float snowR = random(80, 200);
      PVector snowPosition = new PVector(random(0, width), random(19*height/20, height));
      snowOnGround.add(new Snow(snowPosition, snowR));
      count ++;
     } */


// decide x direction acceleration (left or right)
  choice = random(0,1);
  if(choice > 0.5)
    direction = -1;
   else
     direction = 1;

}


class SnowParticle
  {
  PVector position;
  PVector velocity;

  color c;
  boolean alive = true;
  float size = random(125, 250);
  float transparency = random(75, 100);
   
  float r = width/size;

  // for wind
  //PVector difference;
  //float mag;
  //PVector force;

  // size of wind based on volume
  float level = amp.analyze();
  //PVector acceleration = new PVector(direction*0.15*level, 0.1);
  PVector gravity = new PVector(0, 0.05);

  SnowParticle (PVector position, PVector velocity, color c)
  {
    this.c = c;
    this.position = position.copy();
    this.velocity = velocity.copy();

   // this.acceleration = new PVector(0, .1);
  }

  void display()
  {
    //difference = new PVector((position.x-mouseX), (position.y-mouseY));
    //mag = difference.mag();
    //force = difference.mult(1/mag/mag/mag);
    //force.mult(1000);

    fill(c);
    ellipse(position.x, position.y, r, r);
    position.add(velocity);
    velocity.add(gravity);

    if (position.y > height)
      alive = false;
  }

  void push(PVector force) {
    velocity.add(force);
  }

}
