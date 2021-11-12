PGraphics pg;
Animation ani;
PImage TV;
void setup() {
TV = loadImage("TV.png");  
ani = new Animation();
ani.setup();
size(1000, 705);
pg = createGraphics (600, 600);
}

void draw() {
  
  background(TV);

 pg.beginDraw();
 image(TV, 0, 0);
 if (flipCounter > 0) {
  ani.draw();
 }
 pg.endDraw();
  
  
}
