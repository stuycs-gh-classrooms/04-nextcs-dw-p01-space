Ship player;
int[] stars = new int[299];
int ROWS = 3;
int COLS = 7;
int ENEMYSIZE = 20;
int playerSize = 20;
PVector p;
PVector b;
PVector i;
color playerColor = color(100, 20, 200);
color bulletColor = color(200, 200, 0);
color BadbulletColor = color (204, 49, 106);
int level = 1;
Bullet bullet;
Bullet Badbullet;
EnemyGrid invaders;
boolean gameOver;
boolean won;
boolean paused;
int lives;
int score;


void setup() {
  size(300, 300);
  PVector p = new PVector(width/2, height-ENEMYSIZE/2);
  player = new Ship(p, playerSize, playerColor);
  invaders = new EnemyGrid(ROWS, COLS, ENEMYSIZE);
  PVector b = new PVector (-100, player.center.y - player.size);
  bullet = new Bullet(b, 5);
  PVector i = new PVector ((invaders.topLeft.x + ((random(COLS + 1))*ENEMYSIZE*1.5)),
  invaders.topLeft.y + ((random(ROWS + 1))));
  Badbullet = new Bullet(i, 5);
  gameOver = false;
  won = false;
  paused = false;
  lives = 3;
  score = 0;
  makeStars();
}

void draw() {
  if ((paused == false) && (gameOver == false) && (won == false)){
    background(51, 30, 105);
    
    for (int r = 0; r<stars.length-3; r+=3) {
      fill(240, 230, 255);
      circle(stars[r], stars[r+1], stars[r+2]);
      //println(stars[r], stars[r+1], stars[r+2]);
    }
    
    invaders.display();
    player.display();
    player.move();
    player.changeColor(playerColor);
    bullet.c = bulletColor;
    bullet.display();
    bullet.move();
    
    
    textAlign(RIGHT);
    textSize(20);
    text("lives: " + lives, 60, 15);
    textAlign(LEFT);
    textSize(20);
    text("score: " + score, width-72, 15);
    
    Badbullet.yspeed = 8;
    Badbullet.display();
    Badbullet.move();
    Badbullet.c = BadbulletColor;
    
    if (Badbullet.center.y >= height *3){
      int c = int(random(COLS));
      int r = int((random(ROWS)));
      if (invaders.grid[r][c] != null){
        Badbullet.center.x = invaders.topLeft.x + (c*ENEMYSIZE*1.5);
        Badbullet.center.y = invaders.topLeft.y + r;
      }
    }
    
    Levels();
    
    boolean playerHit = Badbullet.collisionCheck(player);
    if (playerHit){
      lives = lives - 1;
      Badbullet.center.y = height +10;
    }
    
    boolean invaderHit = invaders.processCollisions(bullet);
    if (invaderHit) {
      //println("hit");
      if (level == 1){
        score += 1;
      }
      if (level == 2){
        score += 2;
      }
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
  
  boolean completeDeath = invaders.hitPlayer(player);
    if (completeDeath) {
      gameOver = true;
    }
    if (lives == 0) {
      gameOver = true;
    }
    
    if((level == 2) && (invaders.allGone() == true)){
      won = true;
    }
    
  if (gameOver){
    background(51, 30, 105);
    textAlign(CENTER);
    textSize(width/10);
    text("GAME OVER", width/2, height/2);
    textSize(width/14);
    text("SCORE: " + score, width/2, height/2 + width/10);
  }
  
  if (won){
    background(51, 30, 105);
    textAlign(CENTER);
    textSize(width/10);
    text("YOU WON !!!", width/2, height/2);
    textSize(width/14);
    text("SCORE: " + score, width/2, height/2 + width/10);
  }
  
  if (paused){
    textAlign(CENTER);
    textSize(width/10);
    text("PAUSED", width/2, height/2);
  }
}


void makeStars() {
  
  for (int r = 0; r<stars.length-3; r+=3) {
    stars[r] = (int(random(width)));
    stars[r+1] = (int(random(height)));
    stars[r+2] = int(random(2, 5));
  }
}

void Levels() {
  boolean newLevel = invaders.allGone();
  if (newLevel && (level == 1)){
    print("newlebel");
    bullet.center.x = -100;
    delay(300);
    invaders.reset();
    invaders.level = 2;
    color level2Color = color(135, 200, 204);
    invaders.changeColor(level2Color);
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
  
  if (key == 'r') {
    gameOver = false;
    invaders.reset();
    lives = 3;
    player.center.x = width/2;
    player.center.y = height - playerSize/2;
    bullet.center.y = -100;
    Badbullet.center.y = height*2;
  }
}

void mousePressed(){
  if ((mousePressed) & (mouseX < width) & (mouseY < height)){ //the ands arent necessary but i wasnt sure how else to demonstrate I know how to use mouse cords
    if ((paused == false) && (gameOver == false) && (won == false)){
      paused = true;
    }else{
      paused = false;
    }
  }
}

void newBullet() {
  PVector b = new PVector (-100, player.center.y - player.size);
  bullet = new Bullet(b, 5);
}//newBullet
