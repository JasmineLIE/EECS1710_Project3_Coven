//Flashlight effect reference: http://learningprocessing.com/examples/chp15/example-15-09-FlashLight

int numEyes = 2;
Eyes eye1;
Eyes eye2;

PImage TV;

int alphaValue = 0;
class TV {

  void loadImages() { //also works as general setup
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


//a flashlight effect is being made


          pixels[loc] = color(r, g, b);
        }

        updatePixels();
      }
    }
    eye1.run();
    eye2.run(); //eyes in the cracks on of the T.V that follow the mouse

    switch(flipCounter) { //text that displays depending on what program is run on the TV; tells the story
    case 1:
      textSize(30);
      fill(#88C499, 175);
      textAlign(CENTER);
      text("ACT 1", 135, 600);

      textSize(25);

      textAlign(CENTER);
      text("There once was a Witch King who had three beating hearts \n His influence stretched near and far.", width/2, 650);
      break;
    case 2:
      textSize(30);
      fill(#88C499, 175);
      textAlign(CENTER);
      text("ACT 2", 135, 600);

      textSize(25);

      textAlign(CENTER);
      text("His name was Sable the III, tyrannical and mad. \n He craved power through means oh so crass.", width/2, 650);
      break;
    case 3:
      textSize(30);
      fill(#88C499, 175);
      textAlign(CENTER);
      text("ACT 3", 135, 600);

      textSize(25);

      textAlign(CENTER);
      text("On the third year of his reign, on the third month \n of the third day, he met his demise", width/2, 650);

      break;
    case 4:
      textSize(30);
      fill(#88C499, 175);
      textAlign(CENTER);
      text("ACT 4", 135, 600);

      textSize(25);

      textAlign(CENTER);
      text("His soul was locked away thrice by the Bright Witches.\n No other means of banishment would have sufficed", width/2, 650);
      break;
    }
  }

  void run() {
    draw();
  }
}
