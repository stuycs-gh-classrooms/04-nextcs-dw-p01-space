Ship player;
PVector p;
PVector b;
color playerColor = color(100, 20, 200);
color bulletColor = color(200, 200, 0);
int level = 1;
Bullet bullet;
EnemyGrid invaders;


void setup() {
  size(400, 400);
  PVector p = new PVector(width/2, height-10);
  player = new Ship(p, 20, playerColor);
  invaders = new EnemyGrid(3, 5, 20);
  PVector b = new PVector (-100, player.center.y - player.size);
  bullet = new Bullet(b, 5);
}

void draw() {
  background(255);
  invaders.display();
  player.display();
  player.move();
  player.changeColor(playerColor);
  bullet.c = bulletColor;
  bullet.display();
  bullet.move();
  Levels();
  
  boolean invaderHit = invaders.processCollisions(bullet);
  if (invaderHit) {
    //println("hit");
    newBullet();
  }
  //println(bullet.center.y);
  if (bullet.center.y < 0){
    newBullet();
  }
  if (frameCount % 30 == 0) {
    invaders.move();
  }
}

void Levels() {
  boolean newLevel = invaders.allGone();
  if (newLevel && (level == 1)){
    print("newlebel");
    bullet.center.x = -100;
    delay(300);
   
    invaders.level2();
    level = 2;
  }
}

void keyPressed(){
  if (key == ' ') {
    bullet.center.x = player.center.x;
    bullet.yspeed = -15;
  }
  if (keyCode == LEFT) {
    player.center.x -= 3;
    //need to make boolean for 'has been shot' that will no longer make bullet
    //move side to side
  }
  if (keyCode == RIGHT) {
    player.center.x += 3;
  }
}

void newBullet() {
  PVector b = new PVector (-100, player.center.y - player.size);
  bullet = new Bullet(b, 5);
}//newBullet
