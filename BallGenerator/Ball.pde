class Ball 
{
  PVector position;
  PVector velocity;
  float r;
  boolean alive = true;
  
  Ball(PVector position, PVector velocity)
  {
    this.position = position.copy();
    this.velocity = velocity.copy();
    r = 10;
  }
  
  void showBall()
  {
   // PVector position = new PVector(0, 0, 0);
    //PVector velocity = new PVector(random(-2, 2), random(-2, 2), random(-2, 2));
    pushMatrix();
    translate(position.x, position.y, position.z);
    sphere(r);
    popMatrix();
    
    if(position.x > 200 || position.x < 0)
      velocity.x = -1*velocity.x;
    if(position.y > 200 || position.y < 0)
      velocity.y = -1*velocity.y;
    if(position.z > 200 || position.z < 0)
      velocity.z = -1*velocity.z;
    
    position.add(velocity);
    
  }
}
