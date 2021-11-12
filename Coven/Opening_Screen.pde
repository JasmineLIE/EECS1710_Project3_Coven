

boolean readyToProceed = false;



class OpeningScreen {
  int alphaTimer = 0;  
  int alphaTimer2 = 0;
  String openingLines = "You are a Supernatural Investigator\nThe World has forgotten the era of Witch Kings:\nMagic for the wretched\nBut out of sight does not mean out of mind\nYou followed a lead through a Witch's Tomb...\nAnd found a lair\nIn it, an old television and a box\nThey called you mad\nYou know the truth";
  
  void draw() {
    alphaTimer++;
    textSize(30);
    fill(240, alphaTimer);
    textLeading(50);
    textAlign(CENTER);
    text(openingLines, width/2, 100);
    
    if (alphaTimer > 500) {
      alphaTimer2++;
    text("Click Anywhere to Proceed...", width/2, 600);
    fill(240, alphaTimer2);
    readyToProceed = true;
   
  }


  }
  void run() {
    draw();
  }
}
