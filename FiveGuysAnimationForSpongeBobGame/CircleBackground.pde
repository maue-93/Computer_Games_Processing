// (Cx, Cy) is the center of all circles
// cD is the diameter of the circles
// dBC is the constant distance between circles
// bD is the bigest diameter for every loop
// ibD is the incrementation of bD
float Cx, Cy, cD, dBC, bD, ibD;

// bFC back or forth counter
// Color numbers to put in fill function
int bFC, red, green, blue, transparency;

void initiate_CircleBackground() {
  // Set center in the center of the window
  Cx= width/2;
  Cy= height/2;
  // Initiate dBC
  dBC= 30;
  //initiate ibD
  ibD=60;
  // initiate bD
  bD= ibD;
}


void circleBackground() {
  for (cD=bD; 0 < cD; cD-= dBC) {
    // Make random colors for the circles
    red= (int) random(255);
    green= (int) random(255);
    blue= (int) random(255);
    transparency= (int) random(255);
    noStroke();
    fill(red, green, blue, transparency);
    ellipseMode(CENTER);
    ellipse ( Cx, Cy, cD, cD);
  }
  delay(15);

  // Make the movement go back when it touches the edge or is too small
  if ((0< ibD && width< bD) || (0 > ibD && bD < abs(ibD))) { 
    bFC+=1;
    ibD*= -1;
  }

  bD+= ibD;
}