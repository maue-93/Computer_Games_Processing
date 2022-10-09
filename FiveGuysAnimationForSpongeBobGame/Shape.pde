Shape[] shape= new Shape[70];

class Shape {
  int rShape; // Random Integer to decide shape
  boolean home; // to check if shape is at home location
  float homeX; // constant x position
  float homeY; // constant y position
  float tempX; // temporary x position
  float tempY; // temporary y position

  float slope, yIntercept; // fot the y method

  Shape(int homeLocD ) { // Constructor ; homeLocD: Home Location Determinant
    rShape= (int)(random(2.99)); // Randomise rShape
    homeX= tlX+shapeS*xD[homeLocD]; 
    homeY= tlY+shapeS*yD[homeLocD]; 
    tempX= random(width); // random initial x position 
    while (abs(tempX-homeX)<20) { // as long as horizontal distance is <5
      tempX= random(width); // re-randomize tempX
    }
    tempY= random(height); // random initial y position
    while (abs(tempY-homeY)<20) {// as long as vertical distance is <5
      tempY= random(height); // re-randomize tempY
    }
    slope= (homeY-tempY)/(homeX-tempX); // calculate slope
    yIntercept=homeY-slope*homeX; // calculate y-intercept
  }

  void display () {
    rectMode(CORNER);  
    ellipseMode(CORNER);
    noStroke();
    fill(255);

    if (allSquare) {
      rShape=0;
    }

    switch(rShape) { 
    case 0: // rShape=0
      // draw trangle
      rect (tempX, tempY, shapeS, shapeS); 
      break;
    case 1: // rShape=1
      // draw circle
      ellipse (tempX, tempY, shapeS, shapeS);
      break;
    case 2: // rShape=2
      // draw triangle
      triangle (tempX, tempY+shapeS, tempX+shapeS/2, tempY, tempX+shapeS, tempY+shapeS);
      break;
    }// Switch
  }// display method

  float y(float x) {
    return slope*x +yIntercept; // return y value from equation of line
  }

  void move() { 
    if (abs(homeX-tempX)<6) { // if horizontal distance between temporary location and home location is less than 6
      // set x position to home location
      tempX=homeX; 
      tempY=homeY;
      home= true;
    }

    if (tempX!=homeX && tempY!=homeY) {
      if (tempX<homeX) {
        tempX+=4;
      } else {
        tempX-=4;
      }

      tempY=y(tempX);
    }
  }
}// class Shape