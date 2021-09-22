/* 
camera has 3 sets of values: camera(eye(xyz), target(xyz), up(xyz))
  - the eye is where the camera is
  - target is what you are looking at
  - up is the direction that is up 
*/

//move camera, this is a vector for the eye
PVector eye;

PImage wood;
void setup()
{
  size(400, 400, P3D);
  eye = new PVector(0, 0, (height/2.0)/tan(PI*30.0/180.0));
  
  wood = loadImage("wood.png");
}

void draw()
{
  background(0);
  
  //call camera
  camera( eye.x, eye.y, eye.z,
          0, 0, 0,
          0, 1, 0);
  
 // translate(width/4, height/4);
  strokeWeight(1);
  box(20);
  
  strokeWeight(2);
  stroke(255, 0, 0);
  line(0, 0, 0, 200, 0, 0);
  
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 200, 0);
  
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 200);
  
  textureMode(NORMAL);
  //make a rectangle
  beginShape();
  texture(wood);
  vertex(100, 100, 0, 0, 0);
  vertex(200, 100, 0, 1, 0);
  vertex(200, 200, 0, 1, 1);
  vertex(100, 200, 0, 0, 1);
  endShape();
  
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
