int NUM_ROWS = 3;
int NUM_COLS = 5;
int BALL_SIZE = 40;
int PROJECTILE_SIZE = 20;
PVector bCenter;
int bSize;
ShipGrid Ships;
Ship projectile;
Bullet b;

void setup() {
  size(400, 400);

  newProjectile(PROJECTILE_SIZE);
  Ships = new ShipGrid(NUM_ROWS, NUM_COLS, PROJECTILE_SIZE);
  b = new Bullet(bCenter, bSize);
}//setup

void draw() {
  background(255);
  Ships.display();
  
  projectile.display();
  projectile.move();

  boolean hit = Ships.processCollisions(projectile);
  if (hit) {
    newProjectile(PROJECTILE_SIZE);
  }
  if (frameCount % 30 == 0) {
    Ships.move();
  }
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
}//draw


void keyPressed() {
  if (key == ' ') {
    b.display();
    b.move();
  }
  if (keyCode == LEFT) {
    projectile.center.x-=projectile.size;
  }
  if (keyCode == RIGHT) {
    projectile.center.x+=projectile.size;
  }
}//keyPressed

void newProjectile(int psize) {
  PVector p = new PVector(width/2, height-psize/2);
  PVector d = new PVector(width/3, height-psize/2);
  projectile = new Ship(p, psize);
}//newProjectile
