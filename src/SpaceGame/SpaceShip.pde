class SpaceShip {
  int x, y, w, health, ammo, laserCount;
  PImage ship;
  SpaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 1000;
    health = 10;
    ship = loadImage("ship.png");
  }
  void display() {
    imageMode(CENTER);
    ship.resize(80,80);
    image(ship, x, y);
  }
  void move() {
  }
  boolean fire() {
    if(laserCount>0) {
      return true;
    } else {
      return false;
    }
  }
  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
  boolean intersect() {
    return true;
  }
}
