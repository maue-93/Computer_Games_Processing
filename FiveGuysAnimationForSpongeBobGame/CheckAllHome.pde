boolean shapeHome; // To check if all shapes are at home locations
boolean allSquare; // to check if it is time to make all shapes squares
void checkAllHome() {
  if (!shapeHome) { // only check when shapeHome is false to avoid repeating unnecessary loops 
    shapeHome=true; // set shapeHome to true
    for (int i=0; i<70; i++) {
      if (!shape[i].home) { // if one shape is not at home
        shapeHome= false; // set shapeHome to false
      }
    }
  }
}

void fiveGuys() {

  checkAllHome();

  for (int i=0; i<70; i++) {
    shape[i].display();
    shape[i].move();
  }
}