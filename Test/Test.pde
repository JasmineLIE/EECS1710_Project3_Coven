Animation ani;
PImage TV;
void setup() {
TV = loadImage("TV.png");  
ani = new Animation();
ani.setup();
size(1000, 705);
}

void draw() {
  
  background(0);
  
  //image(TV, 0, 0);
 if (flipCounter > 0) {
  ani.draw();
 }
}
