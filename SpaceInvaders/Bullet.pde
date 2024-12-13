class Bullet {
  
  PVector center;
  int yspeed;
  int bsize;
  color c;
  
  Bullet(PVector p, int s) {
    bsize = s;
    center = new PVector(p.x, p.y);
  }
  
  boolean collisionCheck(Enemy other) {
    return (this.center.dist(other.center) <= (this.bsize/2 + other.size/2));
  }//collisionCheck
  
  boolean collisionCheck(Ship other) {
    return (this.center.dist(other.center) <= (this.bsize/2 + other.size/2));
  }//collisionCheck
  
  void display() {
    strokeWeight(0);
    fill(c);
    ellipse(center.x, center.y, bsize, bsize*5);
  }//display
  
  void move() {
    
    center.y += yspeed;
  }//move
  
}//Bullet
