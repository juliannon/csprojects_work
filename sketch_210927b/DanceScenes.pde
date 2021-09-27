int state = 0;

void setup()
{
  fullScreen();
  
}

void draw()
{
  if (state == 0)
    scene0();
  else if (state == 1)
    scene1();
  else if (state == 2)
    scene2();
}
