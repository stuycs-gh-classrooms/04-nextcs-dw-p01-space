class Ship {

  //instance variables
  PVector center;
  int xspeed;
  int yspeed;
  int size;
  color scolor;

   //default constructor
   Ship(PVector p, int s) {
     size = s;
     center = new PVector(p.x, p.y);
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
    circle(center.x, center.y, size);
  }//display

  void setSpeed(int newx, int newy) {
    xspeed = newx;
    yspeed = newy;
  }//setSpeed

  //movement behavior
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
  
 //put in new calss called bullets
 void shootBullet(Ship projectile){
    Ship bullet;
    bullet = new Ship(projectile.center, projectile.size/2);
    bullet.display();
    bullet.yspeed = -2;
  }
}//Ship
