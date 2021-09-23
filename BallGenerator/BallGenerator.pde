
ArrayList<Ball> balls;
PVector eye;

void setup()
{
  size(400, 400, P3D);
  
  balls = new ArrayList<Ball>();
  eye = new PVector(0, 0, (height/2.0)/tan(PI*30.0/180.0));
  
  for (int i = 0; i < 10; i++)
  {
    PVector position = new PVector(random(0, 100), random(0, 100), random(0, 100));
    PVector velocity = new PVector(random(-2, 2), random(-2, 2), random(-2, 2));
    
    balls.add(new Ball(position, velocity));
  }
}

void draw()
{   
  background(0);

  for(Ball b : balls)
    b.showBall();
    
  //translate(width/2, height/2);

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
  //translate(position.x, position.y, position.z);
 // sphere(20);
     
 // position.add(velocity);
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
