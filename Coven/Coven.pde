import processing.sound.*;
PGraphics graphic;
Animation ani;
/*
*Coven is a game that demonstrates the manipulation of pixels.  
 *BG Music: https://www.youtube.com/watch?v=ioEBClyhJZU
 */
OpeningScreen op;
TV tv;
Box pandoraBox;

String gameState; //tracks the game state
SoundFile BGM, boxClick, buttonPress, error, staticNoise, creeps;

void setup() {
  size(1000, 705, P2D);
  BGM = new SoundFile(this, "Audio/BGM.mp3");
  boxClick = new SoundFile(this, "Audio/BoxInteract.mp3");
  buttonPress = new SoundFile(this, "Audio/ButtonPress.mp3");
  error = new SoundFile(this, "Audio/IncorrectCode.wav");
  staticNoise = new SoundFile(this, "Audio/Static.mp3");
  creeps = new SoundFile(this, "Audio/Creeps.wav");
  BGM.loop();
  gameState = "PREGAME";  //set up pregame first
  op = new OpeningScreen();
  tv = new TV();
  tv.loadImages();
  pandoraBox = new Box();
  pandoraBox.loadImages();
  pandoraBox.setup();
  graphic = createGraphics (600, 600);
  ani = new Animation();
  ani.setup();
}

void draw() {
  println(gameState); //debug
  println(mouseX+ ", " + mouseY);

  if (gameState == "PREGAME") {
    preGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "END") {
    gameEnd();
  }
}

void preGame() { //the player is introduced to text on a black screen that tells them their objective
  background(0);
  op.run();
}

void playGame() { //all of what happens in the game falls under here
  background(0);
  tv.run();
  if (!pandoraOpened) {
    graphic.beginDraw();
   
    if (flipCounter > 0) {
      ani.draw();
    }
    graphic.endDraw();
  }
  pandoraBox.run();
}

void gameEnd() { //the endscreen fades in once the player cracks the code
  pandoraBox.run();
  if (doomTimer <0) exit();
}
