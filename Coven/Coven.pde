import processing.sound.*;

/*
*Coven is a game that demonstrates the manipulation of pixels.  You play as a detective who has found themselves in the lair of modern-day Witches.  You'll need to go through different channels on the T.V provided to crack the code of the locked door.
*BG Music: https://www.youtube.com/watch?v=ioEBClyhJZU
*/


String gameState; //tracks the game state
void setup() {
  
}

void draw() {
  
  if (gameState == "PREGAME") {
   preGame(); 
  } else if (gameState == "PLAY") {
   playGame(); 
  } else if (gameState == "END") {
   gameEnd(); 
  }
  
}

void preGame() { //the player is introduced to text on a black screen that tells them their objective
  
}

void playGame() { //all of what happens in the game falls under here
  
}

void gameEnd() { //the endscreen fades in once the player cracks the code
  
}
