
class Image {

  float vy = 1.4;
  PVector position;
  PVector direction;
  PImage img;

  Image(PImage img) {
    position = new PVector(0, 0, 0);
    direction = new PVector(0, -vy, 0);
    imageMode(CENTER);
     this.img = img;
  }
  
  void display(){
    pushMatrix();
    translate(position.x, position.y, position.z);
    
    textureMode(NORMAL);
    
    beginShape();
    texture(img);
    
    float w = 200;
    float h = w*img.height/img.width;
    
    vertex(-w, -h, 0, 0, 0);
    vertex(w, -h, 0, 1, 0);
    vertex(w, h, 0, 1, 1);
    vertex(-w, h, 0, 0, 1);
    
    endShape();
    
    popMatrix();
  }
  
  void move(){
    position.add(direction);
  }
}
void drawScreenSaver()
{
   background(0);

  if (gameState == 0) {
    drawGameState0();
  } else if (gameState == 1) {
    drawGameState1();
  } else if (gameState == 2) {
    drawGameState0();
  }
}
void setGS0(){
  
  int bandWidth = height/4;
  for (int i = 0; i < images.size(); i++) {
    Image currentimg = images.get(i);
    currentimg.position = new PVector(random(300, width-500), random(height + i * bandWidth, height + (i + 1) * bandWidth), random(0, 5));
  }
  
  for (Image i : images){
    i.display();
  }
  
  
}

void drawGameState0() {

  for (Image i : images) {
    i.display();
    i.move();
  }
}

void setGS1() {


  Image first = images.get(currentphoto);

  first.position.x = width/2;
  first.position.y = height/2 + 200;
  first.display();
}

void drawGameState1() {

  Image first = images.get(currentphoto);

  first.move();
  first.display();
}

void keyPressed() {

  if (keyCode == ' ') {
    gameState++;

    if (gameState == 1) {
      setGS1();
    }
     if (gameState == 2){
       setGS0();
     }
  } else if (key == 'a') {
    currentphoto++;
    setGS1();
  }
  
}
