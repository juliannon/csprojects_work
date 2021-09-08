function setup() {
  createCanvas(400, 400);
}
fill(255, 0, 0);
let x = 25;
let y = 200;
let vx = 1;
let vy = 1;

function draw() {
  background(0);
  ellipse(x, y, 50, 50);
  x += vx;
  y += vy;

  if (x > width-25 || x < 25)
  {
    fill(random(255), random(255), random(255));
    vx *= -random(0.5,2);
  }

  if (y > height-25 || y < 25)
  {
    fill(random(255), random(255), random(255));
    vy *= -random(0.5,2);
  }
}
