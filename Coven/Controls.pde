void mousePressed() {
  if (readyToProceed) {
    gameState = "PLAY";
  }
  if (mouseX > bxR-arrowSizeX && mouseX < bxR+arrowSizeX && 
    mouseY > byR-arrowSizeY && mouseY < byR+arrowSizeY && pandoraOpened) {
    buttonPress.play();
    numberCounter++;
    if (numberCounter > numberList.length - 1) numberCounter = 0;
  } else if (mouseX > bxL-arrowSizeX && mouseX < bxL+arrowSizeX && 
    mouseY > byL-arrowSizeY && mouseY < byL+arrowSizeY && pandoraOpened) {
    buttonPress.play();
    numberCounter--;
    if (numberCounter < 0) numberCounter = numberList.length-1;
  }
  
  if (mouseX > bxO-boxSizeX && mouseX < bxO+boxSizeX && 
    mouseY > byO-boxSizeY && mouseY < byO+boxSizeY && pandoraOpened  && numberCounter == 2) {
    pandoraUnlocked = true;
    
    
} else if (mouseX > bxO-boxSizeX && mouseX < bxO+boxSizeX && 
    mouseY > byO-boxSizeY && mouseY < byO+boxSizeY && pandoraOpened) {
   error.play();
}
}
void keyPressed() {
  if (gameState == "PLAY" ) {
    if (key == 'x') {
      if (pandoraOpened) {
        pandoraOpened = false;
        boxStatus = 2;
      } else {
        pandoraOpened = true;
        boxStatus = 1;
      }
      if (key == 'x' && boxStatus == 1) {
        boxClick.play();
      }
    }
  }
 if (!pandoraOpened) { 
  if (key == '1') {
 flipCounter = 1; 
 buttonPress.play();


} else if (key == '2') {
 flipCounter = 2; 
buttonPress.play();

} else if (key == '3') {
 flipCounter = 3; 
buttonPress.play();

} else if (key == '4') {
 flipCounter = 4; 
buttonPress.play();
 
}

}
}
