class ShipGrid {

  Ship[][] grid;
  int shipSize;
  PVector topLeft;
  int gridWidth;
  int gridHeight;
  int direction;

  ShipGrid(int rows, int cols, int size) {
    grid = new Ship[rows][cols];
    shipSize = size;
    gridWidth = shipSize * cols;
    gridHeight = shipSize * rows;
    direction = RIGHT;
    topLeft = new PVector(shipSize/2, shipSize/2);
    makeShips();
  }//constructor

  void makeShips() {
    PVector pos = topLeft.copy();
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        grid[r][c] = new Ship(pos, shipSize);
        grid[r][c].setSpeed(shipSize, 0);
        pos.x+=shipSize;
      }//columns
      pos.y+= shipSize;
      pos.x = topLeft.x;
    }//rows
  }//makeShips

  void display() {
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].display();
        }
      }//columns
    }//rows
  }//drawGrid

  boolean processCollisions(Ship p) {
    boolean hit = false;
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null && p.collisionCheck(grid[r][c])) {
          grid[r][c] = null;
          hit = true;
        }//collide!
      }//columns
    }//rows
    return hit;
  }//processCollisions

  void move() {

    if (direction == DOWN) {
      topLeft.y+= shipSize;
    }
    else if (direction == LEFT) {
      topLeft.x-= shipSize;
    }
    else if (direction == RIGHT) {
      topLeft.x+= shipSize;
    }

    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].move();
        }
      }//columns
    }//rows

    checkSpacing();
  }//move

  void checkSpacing() {
    float leftEdge = topLeft.x - (shipSize/2);
    float rightEdge = leftEdge + gridWidth;
    float topEdge = topLeft.y - (shipSize/2);

    //println(rightEdge);

    if (direction == DOWN) {
      if (leftEdge <= 0) {
        direction = RIGHT;
      }
      if (rightEdge >= width) {
        direction = LEFT;
      }
      changeDirection();
    }//switching left/right
    else if (leftEdge <= 0) {
      direction = DOWN;
      changeDirection();
    }
    else if (rightEdge >= width) {
      direction = DOWN;
      changeDirection();
    }
  }//checkSpacing

  void changeDirection() {
    int newx, newy;
    newx = 0;
    newy = 0;
    if (direction == LEFT) {
      newx = -shipSize;
    }//left
    if (direction == RIGHT) {
      newx = shipSize;
    }//right
    if (direction == DOWN) {
      newy = shipSize;
    }//down

    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].setSpeed(newx, newy);
        }
      }//columns
    }//rows
  }//changeDirection
}//ShipGrid
