ArrayList<Dot> dots;
int currentColor;

void setup()
{
  size(500, 500);
  colorMode(HSB, 100);
  noStroke();
  
  //create new array list for dots
  dots = new ArrayList<Dot>();
}

void draw()
{
  background(0);
  //colors
  if(currentColor > 100)
      currentColor = 0;
  currentColor++;
  
  //show the ddots
  for(Dot d : dots)
    d.showDot();
  
  //declare PVectors
  PVector position = new PVector(mouseX, mouseY);
  PVector velocity = new PVector(random(-2,2), random(-2,2));
  
  dots.add(new Dot(position, velocity));
   
   //remove dots
   for (int i=dots.size()-1; i>=0; i--)
     if(dots.get(i).alive == false)
       dots.remove(i);
}

class Dot
{
 PVector position;
 PVector velocity;
 float r;
 int hue;
 boolean alive = true;
 
 Dot(PVector position, PVector velocity)
 {
   this.position = position.copy();
   this.velocity = velocity.copy();
   r = 2;
   hue = currentColor;
 }
 
 void showDot()
 {
   fill(hue, 100, 100);
   
   ellipse(position.x, position.y, 2*r, 2*r);
   
   //update acceleration
   PVector acceleration = new PVector(width/2, height/2);
   acceleration.sub(position);
   float m = acceleration.mag();
   acceleration.mult(1/m/m/m);
   acceleration.mult(1000);

   position.add(velocity);
   velocity.add(acceleration);
   
   //not alive when out of borders
   if(position.x>width || position.x<0 || position.y>height || position.y<0)
     alive = false;
 }
}
