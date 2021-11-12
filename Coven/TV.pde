//Flashlight effect reference: http://learningprocessing.com/examples/chp15/example-15-09-FlashLight
int numEyes = 2;
Eyes eye1;
Eyes eye2;

PImage TV;
PGraphics pg;
int alphaValue = 0;
class TV {

  void loadImages() {
    TV = loadImage("Images/TV.png");
    eye1 = new Eyes(377, 674, 10);
    eye2 = new Eyes(26, 22, 10);
 
    
  }
  void draw() {
if (gameState == "PLAY") {
  
  loadPixels();
  TV.loadPixels();

//flashlight affect; manipulates pixels; the brightest area follows the cursorx
  for (int x = 0; x < TV.width; x++ ) {
    for (int y = 0; y < TV.height; y++ ) {

      int loc = x + y*TV.width;

    
      float r = red  (TV.pixels[loc]);
      float g = green(TV.pixels[loc]);
      float b = blue (TV.pixels[loc]);


      float distance = dist(x, y, mouseX, mouseY);


      float adjustBrightness = map(distance, 0.5, 500, 2, 0.5);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

 

 
     
      pixels[loc] = color(r, g, b);
      

  }

  updatePixels();
   
  }
  }
  eye1.run();
  eye2.run();
  }
  
  void run() {
   draw(); 
  }
}
