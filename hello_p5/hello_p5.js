function setup() {
  createCanvas(400, 400);
}

let x = 25;
let y = 200;
let vx = 1;
let vy = 1;

function draw() {
  background(0);
  fill(255, 0, 0)
  ellipse(x, y, 50, 50);
  x += vx;
  y += vy;

  if (x > width-25 || x < 25)
    vx *= -1;

  if (y > height-25 || y < 25)
    vy *= -1;
}
