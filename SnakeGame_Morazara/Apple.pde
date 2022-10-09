PImage appleImage;

class Apple {
  float x, y; // x and y position of the apple
  int rectNX, rectNY; /* random (int)random(1, divisor) rectangle x and y position of apple
   appleX= rectNX* rectW 
   appleY= rectNY* rectH
   */

  void display() {
    imageMode(CENTER);
    image(appleImage, x, y);
  } 

  // function to randomize apple position 
  void random_Location() {
    // randomize apple rectangle position
    rectNX= (int)random(1, divisor);
    rectNY= (int)random(1, divisor);

    // update x, y position 
    x= (rectNX + 1/2.0)* rectW;
    y= (rectNY + 1/2.0)* rectH;
  }
}
