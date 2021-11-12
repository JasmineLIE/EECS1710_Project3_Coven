void mousePressed() {
  if (readyToProceed) {
    gameState = "PLAY";
  }//depending on what arrow button on the box is pressed, the number counter will go up or down
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
    
    //if the number counter is at 2, which is where the element '3' is kept in the array, pandora's box will be unlocked
    
} else if (mouseX > bxO-boxSizeX && mouseX < bxO+boxSizeX && 
    mouseY > byO-boxSizeY && mouseY < byO+boxSizeY && pandoraOpened) {
   error.play();
   //otherwise, other numbers will generate an error sound if the unlock button is pressed and it is not the correct number
}
}
void keyPressed() { //sound that toggles when the box is viewed
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
 if (!pandoraOpened) {  //set what image on the T.V is being viewed
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
