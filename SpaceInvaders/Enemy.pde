class Enemy {
  
  PVector center;
  int xspeed;
  int yspeed;
  int size;
  color c;
  
  Enemy(PVector p, int s, color col) {
    size = s;
    center = new PVector(p.x, p.y);
    c = col;
  }
  
  void setColor(color newC) {
    c = newC;
  }
  
  void display() {
    fill(c);
    circle(center.x, center.y, size);
  }//display
  
  void setSpeed(int newx, int newy) {
    xspeed = newx;
    yspeed = newy;
  }//setSpeed
  
  void move() {
    
    
    if (center.x > width - size/2 ||
        center.x < size/2) {
        xspeed*= -1;
     }
     if (center.y > height - size/2 ||
         center.y < size/2) {
         yspeed*= -1;
      }
     center.x+= xspeed;
     center.y+= yspeed;
  }//move
  
} //enemy

class EnemyGrid {
  Enemy[][] grid;
  int enemySize;
  PVector topLeft;
  int gridWidth;
  int gridHeight;
  int direction;
  int level;
  float yspacing;
  
  EnemyGrid(int rows, int cols, int eSize) {
    enemySize = eSize;
    grid = new Enemy[rows][cols];
    gridWidth = int(eSize * cols * 1.5);
    gridHeight = int(eSize * rows * 1.2);
    direction = RIGHT;
    topLeft = new PVector(enemySize/2, enemySize/2);
    makeEnemies();
    level = 1;
  }
  
  void makeEnemies() {
    PVector pos = topLeft.copy();
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c] = new Enemy(pos, enemySize, c);
        grid[r][c].setSpeed(enemySize, 0);
        pos.x += int(enemySize * 1.5);
      }//columns
      pos.y += int(enemySize * 1.2);
      pos.x = topLeft.x;
    }//rows
  }//makeEnemies
  
  void display() {
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].display();
        }
      }//columns
    }//rows
  }//drawGrid
  
  boolean processCollisions (Bullet b) {
    boolean hit = false;
    for (int r = 0; r < grid.length; r++ ) {
      for (int c = 0; c < grid[r].length; c++) {
        if (grid[r][c] != null && b.collisionCheck(grid[r][c])) {
          grid[r][c] = null;
          hit = true;
          //println("hit");
        }//collision
      }//columns
    }//rows
    return hit;
  }//processCollisions
  
  void move() {
    checkSpacing();
    
    if (direction == DOWN) {
      topLeft.y += enemySize;
    }
    else if (direction == LEFT) {
      topLeft.x -= enemySize;
    }
    else if (direction == RIGHT) {
      topLeft.x += enemySize;
    }
    
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        if (grid[r][c] !=null) {
          grid[r][c].move();
        }
      }//columns
    }//rows

  }//move
  
  void checkSpacing() {
    float leftEdge = topLeft.x - (enemySize/2);
    float rightEdge = leftEdge + gridWidth;
    float topEdge = topLeft.y - (enemySize/2);
    float bottomEdge = topEdge + gridHeight;
    
    if (level == 1){
      if (direction == DOWN) {
        if (leftEdge <= 0) {
          direction = RIGHT;
        }
        if (rightEdge >= width) {
          direction = LEFT;
        }
        changeDirection();
      }//switch left or right
      else if (leftEdge <= 0) {
        direction = DOWN;
        changeDirection();
      }
      else if (rightEdge >= width) {
        direction = DOWN;
        changeDirection();
      }
    }
    
    if (level == 2) {
      if (direction == DOWN) {
        if (leftEdge <= 0) {
          direction = DOWN;
          //print(topEdge);
          color danger = color(200, 100, 40);
          color peaceful = color(135, 200, 204);
          if ((topEdge >= width/5) && (topEdge <= (2*width/5)) && (bottomEdge < width - 30)){
          direction = RIGHT;
            changeColor(peaceful);
          }else{
            changeColor(danger);
          }
        }
        if (rightEdge >= width) {
          direction = LEFT;
        }
        changeDirection();
      }//switch left or right
      else if (leftEdge <= 0) {
        direction = DOWN;
        changeDirection();
      }
      else if (rightEdge >= width) {
        direction = DOWN;
        changeDirection();
      }
    }
    
  }//checkSpacing
  
  void changeDirection() {
    int newx, newy;
    newx = 0;
    newy = 0;
    if (direction == LEFT) {
      newx = -enemySize;
    }//left
    if (direction == RIGHT) {
      newx = enemySize;
    }//right
    if (direction == DOWN) {
      newy = enemySize;
    }//down
    
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].setSpeed(newx, newy);
        }
      }//columns
    }//rows
  }//changeDirection
  
 
 // SECOND LEVEL NONSENSE (NEEDS DEBUGGING)
  
  boolean allGone() {
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        if (grid[r][c] != null) {
          //println("more enemies");
          return (false);
        }
      }//columns
    }//rows
    println("no more enemies");
    return (true);
  }
  
  void changeColor(color col){
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        if (grid[r][c] != null){
          grid[r][c].setColor(col);
        }
      }
    }
  }
  
  void reset() {
    topLeft.x = enemySize/2;
    topLeft.y = enemySize/2;
    makeEnemies();
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c].setSpeed(4, 1);
      }
    }
  }//
  
// END OF SECOND LEVEL STUFF
  
  float findBottom(){
    float topEdge = topLeft.y - (enemySize/2);
    for (int r = grid.length-1; r > 0; r--) {
      for (int c = grid[r].length -1; c > 0; c--) {
        if (grid[r][c] != null) {
          return (grid[r][c].center.y);
        }
      }
    }
    return (topEdge);
  }
  boolean hitPlayer(Ship other) {
    float bottomEdge = findBottom();
    //println(bottomEdge, bottomEdge - enemySize,  height - other.size);
    return (( bottomEdge)
             >= (height - other.size) );
  }
  
}//EnemyGrid
