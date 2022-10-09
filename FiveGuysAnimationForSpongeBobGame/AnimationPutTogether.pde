void initiate_AnimationVariables() {
  animationSizeLocation ();
  initiate_CircleBackground();
  initiateCRBackground();
  animationSizeLocation ();
}

void animation() {
  if (bFC<2) {
    circleBackground();
  }

  if (bFC==2) {
    CRBackground();
    fiveGuys();
    if (shapeHome && !allSquare) {
      delay(1000);
      allSquare=true;
    }
    if (allSquare) {    
      rectMode(CORNER);
      rect(tlX+shapeS*4, tlY+shapeS*20, shapeS*22, shapeS);
    }
  }
}