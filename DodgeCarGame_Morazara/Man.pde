float manSize;
float manX;
float manY;

void displayMan () {
  rectMode(CENTER);
  fill(0);
  ellipse(manX, manY, manSize, manSize);
}

void keyPressed() {
  
  // Move Left
  if ((key=='a') || (key== 'A')) { 
    manX=5*width/12;
  }
  // Move right
    if ((key=='d') || (key== 'D')) { 
    manX=7*width/12;
  }
}