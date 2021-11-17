//for timing
int state = 0;

//sound
import processing.sound.*;
Amplitude amp;
AudioIn microphone;

//for fireworks program
float level;
int genRate;
ArrayList<Burst> bursts;
float d = 1;
boolean generate = true;
int currentColor;

//for snow program
ArrayList<SnowParticle> snowParticles;

//for screenSaver program
ArrayList<Image> images;
int gameState = 0;
int currentphoto = 0;
PImage img1, img2, img3, img4, img5;
PImage img7th, img7th2, img8th, img8th2, img9th, img9th2, img10th, img10th2, img11th;

void setup()
{
  fullScreen(P3D);
  noStroke();

  //sound
  microphone = new AudioIn(this);
  microphone.start();
  amp = new Amplitude(this);
  amp.input(microphone);

  //fireworks
  bursts = new ArrayList<Burst>();

  //snow
  snowParticles = new ArrayList<SnowParticle>();
  
  //screenSaver
  images = new ArrayList<Image>();

  img1 = loadImage("image1.jpeg");
  img2 = loadImage("image3.jpeg");
  img3 = loadImage("image4.jpeg");
  img4 = loadImage("image5.jpeg");
  img5 = loadImage("image6.jpeg");
  img7th = loadImage("7thgrade.png");
  img7th2 = loadImage("7thgrade(1).jpeg");
  img8th = loadImage("8thgrade.jpeg");
  img8th2 = loadImage("8thgrade(1).jpeg");
  img9th = loadImage("9thgrade.jpeg");
  img9th2 = loadImage("9thgrade(1).jpeg");
  img10th = loadImage("10thgrade(1).jpeg");
  img10th2 = loadImage("10thgrade.jpeg");
  img11th = loadImage("11thgrade.png");


  images.add(new Image(img7th));
  images.add(new Image(img7th2));
  images.add(new Image(img8th2));
  images.add(new Image(img9th2));
  images.add(new Image(img9th));
  images.add(new Image(img10th2));
  images.add(new Image(img11th));
  
  
  images.add(new Image(img1));
  images.add(new Image(img10th2));
  images.add(new Image(img7th2));
  images.add(new Image(img8th2));
  images.add(new Image(img3));
  images.add(new Image(img4));
  images.add(new Image(img9th2));
  images.add(new Image(img5));
  images.add(new Image(img11th));
  images.add(new Image(img7th));
  images.add(new Image(img8th2));
  images.add(new Image(img3));
  images.add(new Image(img10th));
  images.add(new Image(img8th));
  images.add(new Image(img5));
  images.add(new Image(img8th2));
  images.add(new Image(img7th2));
  images.add(new Image(img10th2));
  images.add(new Image(img4));
  images.add(new Image(img9th));
  images.add(new Image(img1));
  images.add(new Image(img9th2));
   images.add(new Image(img7th));
  images.add(new Image(img8th));
  images.add(new Image(img2));
  images.add(new Image(img4));
  images.add(new Image(img9th));
  images.add(new Image(img1));
  images.add(new Image(img10th2));
  images.add(new Image(img5));
  images.add(new Image(img3));
  images.add(new Image(img11th));
  images.add(new Image(img7th2));
  images.add(new Image(img9th2));
  images.add(new Image(img2));
   images.add(new Image(img7th));
  images.add(new Image(img2));
  images.add(new Image(img10th));


  // loop through images and set position
  int bandWidth = height/4;
  for (int i = 0; i < images.size(); i++) {
    Image currentimg = images.get(i);
    currentimg.position = new PVector(random(300, width-500), random(height + i * bandWidth, height + (i + 1) * bandWidth), random(0, 5));
  }
}


void draw()
{
  int timePassed = frameCount;
  if (timePassed % 1000 == 0)
  {
    if (state < 2)
      state ++;
    else if (state == 2)
      state = 0;
  }

  if (state == 0)
  {
    colorMode(HSB, 100);
    noStroke();
    drawFireworks();
  } else if (state == 1)
    drawSnow();
   else if(state == 2)
    drawScreenSaver();
  /* else if(state > 1)
   {
   state = 0;
   }*/
  println(timePassed);
}
