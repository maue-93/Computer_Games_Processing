float sizeMin= 30; // Minimum size of bubble while randamizing
float sizeMax= 60; // Maximum size of bubble while randamizing

class Bubble {

  float x; // x position of bubble
  float y; // y position of bubble
  float size; // Size of square
  int red; // Random integer between 0 and 255 fo Red in RGB color
  int green; // Random integer between 0 and 255 fo Green in RGB color
  int blue; // Random integer between 0 and 255 fo Blue in RGB color
  float speed= -1.0; // Speed of the bubble, -1 as initial

  // Run this method for initializing a bubble
  void initialize () {
    size= random(sizeMin, sizeMax); // Randomize size 
    x= random(size/2, width-size/2); // Randomize x position
    y=height; // y position slways starts from the bottom 

    // Randomize color
    red= (int) random (255);
    green= (int) random (255);
    blue= (int) random (255);
  }

  // Display method
  void display () {
    fill(red, green, blue);
    stroke(255);
    ellipseMode(CENTER);
    ellipse(x, y, size, size);
  }

  // Move and jitter method
  void moveAndJitter () {
    y= (y+speed)% height;
    x= x+ random(-3, 3);
  }

  void scoreAndSpeed() {
    if (mousePressed && dist(x, y, mouseX, mouseY)<=size/2) {
      // A bubble is popped
      score = score +1; // score up

      // Then, initialize
      initialize();
    } 

    if (y+speed<=0) {
      // Square hit the top edge
      score= score-1; // score dow

      // Then, initialize
      initialize();
    }

    if (score<=0) {
      speed= -1; // speed held constant at 1
    } else {
      speed= -1 + (-score)/2.0; // speed in function of score}
    }
  }
}