class Circle {
  float minSize= 20; // minimum size when randomizing
  float maxSize= 50; // maximum size when randomizing
  float size;

  float x; // x position
  float y; // y position

  // Color variables
  int red;
  int green;
  int blue;
  int transparency;

  void initialize() {
    // Randomize size
    size= random(minSize, maxSize);

    // constrain in window
    x= random(size/2, width-size/2);
    y= random(size/2, height-size/2);

    // randomize RGB and transparency
    red= (int) random(255);
    green= (int) random(255);
    blue= (int) random(255);
    transparency= (int) random(100, 250);
    
  }

  void display() {
    // Draw circle
    ellipseMode(CENTER);
    noStroke();
    fill(red, green, blue, transparency);

      ellipse(x, y, size, size);

  }

  void fadeAway() {
    // Transparency decreases 
    transparency--;
    // Re-initialize everytime trasparency is 0
    if (transparency==0) {
      initialize();
    }
  }
}