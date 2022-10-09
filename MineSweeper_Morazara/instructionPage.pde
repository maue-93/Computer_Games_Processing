void instructionPage() {// First page

  String instruction;

  instruction="MINESWEEPER\n"+
    "The goal of the game is to identify all the existing mines on the field.\n"+
    "Click Right on a grid if you think it contains a mine. A flag will appear.\n"+
    "Click Right on the flag if you want to cancel it (if you think it does not contain a mine anymore).\n"+
    "Click Left to open a grid. if it contains a mine, you lose the game.\n"+
    "If not, it displays the number of neighboring mines.\n"+
    "If there are no mine next to it, the game will open all the surrounding none zero number.\n"+
    "If you have number of flags equal to number of mines, the game stops and verifies.\n"+
    "If you identify all the mines, you win the game.\n"+
    "If Game Over, the x image means you guess wrong on a grid you thought had a mine.\n"+
    "Select from these 3 game number of mines the size of the field will be the number you chose squared: ";

  textAlign(CENTER);
  textSize(12);
  fill(0);
  text(instruction, width/2, height/6);

  // Options:
  rectMode(CORNER);
  // Easy
  stroke(0);
  fill(0);
  rect(width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("10", 2*width/12, 8 *height/14);

  // Moderate
  fill(0);
  rect(5*width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("20", 6*width/12, 8 *height/14);

  // Hard
  fill(0);
  rect(9*width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("30", 10*width/12, 8 *height/14);
}


void mousePressed() {

  if (!play) { // If mouse is pressed and game has not started

    if (width/12<=mouseX && mouseX<=3*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Player choose 10
      resetGame(10);
      play=true;
      gameOver=false;
    }

    if (5*width/12<=mouseX && mouseX<=7*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Player choose 20
      resetGame(20); 
      play=true;
      gameOver=false;
    }

    if (9*width/12<=mouseX && mouseX<=11*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Player choose 30
      resetGame(30);
      play=true;
      gameOver=false;
    }
  }
}
