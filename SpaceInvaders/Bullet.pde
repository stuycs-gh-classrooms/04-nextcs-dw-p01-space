class Bullet {

  //instance variables
  PVector center;
  int yspeed;
  int size;
  color scolor;

   //default constructor
   Bullet(PVector p, int s) {
     size = s;
     center = new PVector(150, 150);

   }

  boolean collisionCheck(Ship other) {
    return ( this.center.dist(other.center)
             <= (this.size/2 + other.size/2) );
  }//collisionCheck
  
  void setColor(color newC) {
    scolor = newC;
  }//setColor

  //visual behavior
  void display() {
    fill(scolor);
    ellipse(center.x, center.y, size, 2*size);
  }//display
  
  void move() {
     if (center.y > height - size/2 ||
         center.y < size/2) {
         yspeed*= -3;
      }
     center.y+= yspeed;
  }//move
  
  
}
