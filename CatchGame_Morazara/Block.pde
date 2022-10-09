float sizeMin= 30; // Minimum size of square while randamizing
float sizeMax= 60; // Maximum size of square while randamizing

class Block {

  float x; // x position of square
  float y; // y position of square
  float size; // Size of square
  int red; // Random integer between 0 and 255 fo Red in RGB color
  int green; // Random integer between 0 and 255 fo Green in RGB color
  int blue; // Random integer between 0 and 255 fo Blue in RGB color
  float speed= 1.0; // Speed of the squares, 1 as initial

  // Run this method for initializing a block
  void initialize () {
    size= random(sizeMin, sizeMax); // Randomize size
    x= 0; // x position slways starts from the left 
    y=random(size/2, height-size/2); // Randomize y position

    // Randomize color
    red= (int) random (255); 
    green= (int) random (255);
    blue= (int) random (255);
  }

  // Display method
  void display () {
    stroke(255);
    fill(red, green, blue); // Apply random color
    rectMode(CENTER);
    rect(x, y, size, size); // draw the square
  }
  // Move method
  void move () {
    x= (x+speed)% width;
  }

  void scoreAndSpeed() {

    if ((paddleX-paddleWidth/2<=x+size/2 && x+size/2<=paddleX) && 
      ((paddleY-paddleHeight<=y-size/2 && y-size/2<=paddleY+paddleHeight/2) || 
      (paddleY-paddleHeight<=y+size/2 && y+size/2<=paddleY+paddleHeight/2))) {
      // Paddle hits square

      score = score +1; // score goes up


      // Then, initialize
      initialize();
    } 

    if (x+speed>=width) {
      // Square hit the right edge
      score= score-1; // score goes down

      // Then, initialize
      initialize();
    }

    if (score<=0) {
      speed= 1; // speed held constant at 1
    } else {
      speed= 1 + score/2.0; // speed in function of score}
    }
  }
}