
PVector position;
PVector velocity;
PVector eye;

void setup()
{
  size(400, 400, P3D);
  position = new PVector(0, 0, 0);
  velocity = new PVector(5, 2, 1);
  eye = new PVector(0, 0, (height/2.0)/tan(PI*30.0/180.0));
}

void draw()
{
  background(0);
  translate(width/4, height/4);
  //call camera
  camera( eye.x, eye.y, eye.z,
          0, 0, 0,
          0, 1, 0);
  
  //x-axis
  stroke(255, 0, 0);
  line(0, 0, 0, 300, 0, 0);
  //y-axis
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 300, 0);
  //z-axis
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 300);
  
  //make sphere
  translate(position.x, position.y, position.z);
  sphere(20);
  
  if(position.x > 200 || position.x < 0)
    velocity.x = -1*velocity.x;
  if(position.y > 200 || position.y < 0)
     velocity.y = -1*velocity.y;
  if(position.z > 200 || position.z < 0)
    velocity.z = -1*velocity.z;
     
  position.add(velocity);
}

//change camera with keypressed
void keyPressed()
{
  //incrament, changes this amount when key is pressed
  int change = 50;
  if (keyCode == RIGHT) 
        eye.x += change;
  else if (keyCode == LEFT)
        eye.x -= change;
  else if (keyCode == UP)
        eye.y -= change;
  else if (keyCode == DOWN)
        eye.y += change;
}
