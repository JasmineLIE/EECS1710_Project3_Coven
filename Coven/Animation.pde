PImage p1, p2, p3, p4, pEye;
ArrayList<Dot> dots;
ArrayList<PVector> target1, target2, target3, target4, target5;
boolean imageToggled = false;
int scaler = 1; //use every pixel
int threshold = 150;

int flipCounter = 0;
color col;
class Animation {

  void setup() {
    p1 = loadImage("Images/Program1.png"); 
    p2 = loadImage("Images/Program2.png"); 
    p3 = loadImage("Images/Program3.png"); 
    p4 = loadImage("Images/Program4.png");
    pEye = loadImage("Images/Eye.png");

    p1.loadPixels();
    p2.loadPixels();
    p3.loadPixels();
    p4.loadPixels();
    pEye.loadPixels();

    target1 = new ArrayList<PVector>();
    target2 = new ArrayList<PVector>();
    target3 = new ArrayList<PVector>();
    target4 = new ArrayList<PVector>();
    target5 = new ArrayList<PVector>();

    col = (#88C499);

    for (int x = 0; x < p1.width; x += scaler) {
      for (int y = 0; y < p1.height; y += scaler) {
        // this translates x and y coordinates into a location in the pixels array
        int loc = x + y * p1.width;

        if (brightness(p1.pixels[loc]) > threshold) {
          target1.add(new PVector(x, y));
        }
      }
    }
    for (int x = 0; x < p2.width; x += scaler) {
      for (int y = 0; y < p2.height; y += scaler) {
        // this translates x and y coordinates into a location in the pixels array
        int loc = x + y * p2.width;

        if (brightness(p2.pixels[loc]) > threshold) {
          target2.add(new PVector(x, y));
        }
      }
    }

    for (int x = 0; x < p3.width; x += scaler) {
      for (int y = 0; y < p3.height; y += scaler) {
        // this translates x and y coordinates into a location in the pixels array
        int loc = x + y * p3.width;

        if (brightness(p3.pixels[loc]) > threshold) {
          target3.add(new PVector(x, y));
        }
      }
    }

    for (int x = 0; x < p4.width; x += scaler) {
      for (int y = 0; y < p4.height; y += scaler) {
        // this translates x and y coordinates into a location in the pixels array
        int loc = x + y * p4.width;

        if (brightness(p4.pixels[loc]) > threshold) {
          target4.add(new PVector(x, y));
        }
      }
    }

    for (int x = 0; x < pEye.width; x += scaler) {
      for (int y = 0; y < pEye.height; y += scaler) {
        // this translates x and y coordinates into a location in the pixels array
        int loc = x + y * pEye.width;

        if (brightness(pEye.pixels[loc]) > threshold) {
          target5.add(new PVector(x, y));
        }
      }
    }


    dots = new ArrayList<Dot>();

    for (int x = 0; x < p1.width; x += scaler) {
      for (int y = 0; y < p1.height; y += scaler) {
        int loc = x + y * p1.width;

        if (brightness(p1.pixels[loc]) > threshold) {
          int targetIndex = int(random(0, target5.size()));
          target1.add(new PVector(x, y));
          Dot dot = new Dot(x, y, col, target5.get(targetIndex));
          dots.add(dot);
        }
      }
    }
  }





  void draw() {

    blendMode(LIGHTEST);


    boolean flipTargets = true;

    for (Dot dot : dots) {
      dot.run();
      if (!dot.ready) flipTargets = false;
    }

    if (flipTargets) {
      for (Dot dot : dots) {
        if (!imageToggled && flipCounter == 1) {
          int targetIndex = int(random(0, target1.size()));
          dot.target = target1.get(targetIndex);
          dot.col = col;
        } else if (!imageToggled && flipCounter == 2) {
          int targetIndex = int(random(0, target2.size()));
          dot.target = target2.get(targetIndex);
          dot.col = col;
        } else if (!imageToggled && flipCounter == 3) {
          int targetIndex = int(random(0, target3.size()));
          dot.target = target3.get(targetIndex);
          dot.col = col;
        } else if (!imageToggled && flipCounter == 4) {
          int targetIndex = int(random(0, target4.size()));
          dot.target = target4.get(targetIndex);
          dot.col = col;
        }
      }
      imageToggled = !imageToggled;
    }
  }
}
