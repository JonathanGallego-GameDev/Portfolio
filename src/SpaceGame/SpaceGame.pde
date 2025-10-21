//Jonathan Gallego| 23 September 2025 | SpaceGame
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer;
int score;
int time;
int level;
int rocksPassed;
boolean play;
void setup() {
  time = 1000;
  size(500, 500);
  s1 = new SpaceShip();
  rockTimer = new Timer(time);
  rockTimer.start();
  score = 0;
  rocksPassed = 0;
  play = false;
  level = 1; 
}

void draw() {
  if(play = false) { // Fix THISSSSSSSSS//
    startScreen();
  } else {
  background(10, 0, 30);
  stars.add(new Star());
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    if (rock.reachedBottom()==true) {
      rocks.remove(rock);
      i--;
      rocksPassed++;
      s1.health--;
    }
  }
  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    for (int j = 0; j<rocks.size(); j++) {
      Rock r = rocks.get(j);
      if (laser.intersect(r)) {
      }
    }
    laser.display();
    laser.move();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }

  s1.display();
  s1.move(mouseX, mouseY);
  infoPanel();
  }
  if(s1.health<1) {
  gameOver();
  }
}

void mousePressed() {
  //laser.play();
  if (s1.fire()) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
    if (time>50);
  }
  println(time);
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 25, width, 50);
  fill(132, 186, 181);
  textSize(20);
  text("Score", 20, 40);
  text(rocksPassed + " Rocks Dodged", width-180, 40);
  text("HEALTH: "+ s1.health, 350, height-20);
  fill(255);
  text("Level" + rocksPassed/5, width-300, height-460);
}

void startScreen() {
 //image (bg1,0,0)
  background(0);
  fill(255);
  text("Space Game - Mouse click to start", width/2,height/2);
  if(mousePressed){
    play= true;
  }
}

void gameOver() {
 //image (bg1,0,0)
  background(0);
  fill(255);
  text("Game Over!", width/2,height/2);
  noLoop();
  }
