class Bullets {
  PVector center;
  int yspeed;
  int bsize;
  
    Bullet(PVector p, int size){
      bsize = size;
      center = new PVector(p.x, p.y);
    }
    
    boolean collisionCheck(Shipgrid invaders) {
      return (this.center.dist(invaders.center)
