
class Row {
  int rowNumber;
  float x;
  float y;
  float rectangleWidth;
  float rectangleHeight;

  // Color variables
  int red;
  int green;
  int blue;
  int transparency=100;

  Row (int rowNumber) {
    this.rowNumber= rowNumber;
  }

  void initialize() {
    x=0;
    y= rectangleHeight*(rowNumber);
    
    rectangleWidth= width;
    rectangleHeight= height/numberOfRows;
    // random color
    red= (int) random(255);
    green= (int) random(255);
    blue= (int) random(255);
    transparency=100; // initial transparency
  }

  void display() {
    rectMode(CORNER);
    noStroke();
    fill(red, green, blue, transparency);
    rect(x, y, rectangleWidth, rectangleHeight); //draw rectangle
  }

  void fadeAway () {
    transparency--; // transparency decreases
    if (transparency<-9) {
      initialize();// reappear after 10 frames
    }
  }
}