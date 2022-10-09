// Background 
void gameBackground() {
  rectMode(CORNER);
  // remove stroke
  noStroke();
  for (int i=1; i<= divisor; i++) {

    for (int u=1; u<= divisor; u++) {
      if (i%2==0 ^ u%2==0) {
        fill(0, 255, 0, 90);
      } else {
        fill(0, 255, 0, 20);
      }
      rect((i-1)*rectW, (u-1)*rectH, rectW, rectH);
    }
  }
  // put back stroke, not to influence other part of the program
  stroke(0);
}
