class Dot{

  PVector position, target;
  color col;
  float speed;
  float dotSize;
  boolean ready;
  float spread = 0.4; //throws the pixels off before they go to their locations, visual effect
  
  Dot(float x, float y, color _col, PVector _target) {
    position = new PVector(x, y);
    col = _col;
    target = _target;
    speed = 0.1;
    dotSize = 2;
    ready = false;
  }
  
  void update() {
    position.lerp(target, speed + random(-spread, spread));
    ready = position.dist(target) < 0.1;
  }
  
  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(position.x+ random(-spread, spread), position.y+ random(-spread, spread));
  }
  
  void run() {
    update();
    draw();
  }

}
