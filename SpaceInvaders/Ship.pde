class Ship {
  
  //instance variables
  PVector center;
  int xspeed;
  int size;
  color c;
  
  //default constructor
  Ship(PVector p, int s, color col) {
    size = s;
    center = new PVector(p.x, p.y);
    col = c;
  }
  
  void changeColor(color newC){
    c = newC;
  }// change color
  
  void display() {
    fill(c);
    circle(center.x, center.y, size);
  }//display
  
  void setSpeed(int newx, int newy) {
    xspeed = newx;
  }//setSpeed
  
  void move() {
    if ((center.x < width - size/2) & (center.x > size/2)){
      center.x += xspeed;
    }
  }//move

}//ship
