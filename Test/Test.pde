PImage TV;
 void setup() {
  size(1000, 705, P2D);
  TV = loadImage("TV.png");
 }
 
 void draw() {
   
   background(0);
   
  loadPixels();
  TV.loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.  TV.loadPixels(); 
  for (int x = 0; x < TV.width; x++ ) {
    for (int y = 0; y < TV.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*TV.width;

      // Get the R,G,B values from image
      float r = red  (TV.pixels[loc]);
      float g = green(TV.pixels[loc]);
      float b = blue (TV.pixels[loc]);

      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x, y, mouseX, mouseY);

      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // We want closer pixels to be brighter, however, so we invert the value using map()
      // Pixels with a distance of 50 (or greater) have a brightness of 0.0 (or negative which is equivalent to 0 here)
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = map(distance, 0.5, 500, 1, 0.5);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

 

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
}
