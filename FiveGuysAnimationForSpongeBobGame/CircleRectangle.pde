CircleRectangle[] popCR= new CircleRectangle[40]; // declare the circles or rectangles for background
class CircleRectangle {
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

  // Determinant of circle or square
  int i;


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
    transparency= (int) random(100, 150);

    i= transparency%3;
  }

  void display() {
    ellipseMode(CENTER);
    noStroke();
    fill(red, green, blue, transparency);
    switch (i) {
    case 0:
      ellipse(x, y, size, size);
      break;
    case 1:
      rect(x, y, size, size);
      break;
    case 2:
      triangle(x, y+size, x+size/2, y, x+size, y+size);
      break;
    }
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

void initiateCRBackground() {
  // Loop to initialize the circles or rectangles
  for (int i=0; i<40; i++) {
    popCR[i]= new CircleRectangle();
    popCR[i].initialize();
  }
}

void CRBackground() {
  for (int i=0; i<40; i++) {
    popCR[i].display();
    popCR[i].fadeAway();
  }
}