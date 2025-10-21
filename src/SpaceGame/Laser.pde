class Laser {

  int x, y, w, h, speed,laserCount;

  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    w = 5;
    h = 15;
    speed = 10;
    laserCount = 1000;
  }
  void display() {
    fill(80);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  void fire() {
  }
  void move() {
    y=y-speed;
  }
  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
}
