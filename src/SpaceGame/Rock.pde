class Rock {
  int x, y, w, h, diam, speed,diagonal;
  PImage r1;
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(5,100));
    speed = int(random(2,5));
    diagonal=int(random(-4,4));
    if(random(10)>4) {
      r1 = loadImage("rock1.png");
    } 
    else if(random(10)>2) {
      r1 = loadImage("rock2.png");
    } else {
      r1 = loadImage("rock3.png");
    }
  }
  void display() {
    imageMode(CENTER);
    r1.resize(100,100);
    image(r1,x,y);
  }
  void move() {
    y = y+speed;
    x = x+diagonal;
  }
  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  boolean reachedBottom() {
    if(y>height+w) {
      return true;
    } else {
      return false;
    }
  }
}
