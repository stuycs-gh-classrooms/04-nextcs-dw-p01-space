int NUM_ROWS = 7;
int NUM_COLS = 10;
int BALL_SIZE = 40;
int PROJECTILE_SIZE = 20;

PVector bCenter;
int bSize;
ShipGrid Ships;
Ship projectile;
Ship b;

void setup() {
  size(400, 400);

  PVector d = new PVector(width/2, height-PROJECTILE_SIZE/2);
  projectile = new Ship(d, PROJECTILE_SIZE);
  Ships = new ShipGrid(NUM_ROWS, NUM_COLS, PROJECTILE_SIZE);
  newProjectile(20);
}//setup

void draw() {
  background(255);
  Ships.display();
  b.display();
  b.move();
  projectile.display();
  projectile.move();

  boolean hit = Ships.processCollisions(b);
  if (hit) {
    newProjectile(PROJECTILE_SIZE);
  }
  println(b.center.y - b.size);
  if ((b.center.y - b.size) < -4){
    newProjectile(PROJECTILE_SIZE);
  }
  if (frameCount % 30 == 0) {
    Ships.move();
  }
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
}//draw


void keyPressed() {
  if (key == ' ') {
    text("Bullet", 150, 150);
    b.yspeed = -6;
  }
  if (keyCode == LEFT) {
    projectile.center.x-=projectile.size;
    // add boolean check to see if bullet has been shot yet
  }
  if (keyCode == RIGHT) {
    projectile.center.x+=projectile.size;
  }
}//keyPressed

void newProjectile(int psize) {
  PVector p = new PVector(width/2, height-psize/2);
  
  int bsize = 10;
  b = new Ship(p, bsize);
}//newProjectile
