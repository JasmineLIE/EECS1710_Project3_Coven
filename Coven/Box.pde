float bxR, byR;
float bxL, byL;
float bxO, byO;

int arrowSizeX = 205; 
int arrowSizeY = 157;
int boxSizeX = 289;
int boxSizeY = 111;


int doomTimer = 200;

boolean pandoraUnlocked = false;
boolean pandoraOpened = false;
int boxStatus;
PImage box, pandoraOrig, leftArrow, rightArrow, openButton, pandora;

float spread = 0.1;
int numberCounter = 0;

String [] numberList = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}; //set up numbers to scroll through on the box

class Box {

  void update() {

   if (pandoraUnlocked) gameState = "END"; //pandoraUnlocked requires the number 3 to be inputted.  
  }

  void loadImages() { //setup
    box = loadImage("Images/Box.png");
    pandoraOrig = loadImage("Images/Pandora.png");
    leftArrow = loadImage("Images/LeftArrow.png");
    rightArrow = loadImage("Images/RightArrow.png");
    openButton = loadImage("Images/OpenButton.png");
    pandora = loadImage("Images/Pandora.png");
  }


  void setup() {
    bxL = 76;
    byL = 385;
    rectMode(RADIUS);
    bxR = 747;
    byR = 382;
    rectMode(RADIUS);
    bxO = 779;
    byO = 571;
    rectMode(RADIUS);
  }

  void creepyTime() {
    if (pandoraUnlocked) {

      if (BGM.isPlaying()) {

        BGM.stop();
        staticNoise.loop();
        creeps.loop();
        buttonPress.loop();
      }
    }
  }

  void pixelDistort() { //the box will undergo pixel distortion when pandora's box is unlocked
    loadPixels();
    pandora.loadPixels();


    int factor1 = int(random(1, 10));
    int factor2 = int(random(1, 10));
    int factor3 = int(random(1, 10));
    int factor4 = int(random(50, 100));

    for (int i=0; i<box.pixels.length; i++) {
      if (i % factor1 == 0) {
        pandora.pixels[i] = color(factor1, factor2, factor3, factor4 );
      } else if (i % factor2 == 0) {
        pandora.pixels[i] = color(factor1, factor2, factor3, factor4 );
      } else if (i % factor3 == 0) {
        pandora.pixels[i] = color(factor1, factor2, factor3, factor4 );
      } else {
        pandora.pixels[i] = pandoraOrig.pixels[i];
      }
    }
    for (int i=0; i<100000; i++) {
      int index1 = int(random(2, pandora.pixels.length));
      int index2 = int(random(2, pandora.pixels.length));
      pandora.pixels[index1] = pandora.pixels[index2];
    }


    pandora.updatePixels();
  }

  void draw() {
println(doomTimer);
println(numberCounter);
    if (pandoraOpened) {
      blendMode(NORMAL);
      image (box, 0, 0);
      image(leftArrow, 0, 0);
      image(rightArrow, 0, 0);
      image (openButton, 0, 0);
      textSize(100);
      fill(255);
      text(numberList[numberCounter], 510, 425);
    }
    if (pandoraUnlocked) { 
      image(pandora, 0, 0);
      numberCounter++;
      if (numberCounter > numberList.length - 1) numberCounter = 0; 

      pixelDistort();
      spread++;
      for (int i=0; i < 10; i++) { 
        text(numberList[numberCounter], random(width), random(height));
        fill(255, 150);
        
        //randomly generate numbers that go through the numberList index repeatedly all over the place
      }
      textSize(70); 
      fill (255, 200);

      text("WHAT HAVE YOU DONE?", width/2 + random(-spread, spread), height/2 + random(-spread, spread));
      doomTimer--;
     
  
    }
    
     
    }
    
  


  void run() {
    draw();
    update();
    creepyTime();
  }
}
