function setup() {
  createCanvas(400, 400);
}

let x = 50;
let y = 200;
let vx = 1;
let vy = 1;

function draw() {
  background(0);
  fill(255, 0, 0)
  ellipse(x, y, 100, 100);
  x += vx;
  y += vy;

  if (x > width+50 || x < 50)
    vx *= -1;

  if (y > height-50 || y < 50)
    vy *= -1;
}
