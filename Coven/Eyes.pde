//reference: https://processing.org/examples/arctangent.html
class Eyes {
 int x, y;
  int size;
  float angle = 0.0;
  
 Eyes(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y-30, mx-x-30);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
  
    rotate(angle);
    fill(#FF0303);
    ellipse(size, size, size, size);
    popMatrix();
  }
  
  void run() {
   update(mouseX-20, mouseY-20);
   display();
  }
}
