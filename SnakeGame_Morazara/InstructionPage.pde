void instructionPage() {
  // First page
  String instruction;

  instruction="SNAKE GAME\n"+
    "The goal of the game is for the snake to eat as many apples as possible.\n"+
    "Move head of snake with arrow directions on keyboard and its body will follow.\n"+
    "Everytime it eats an apple, its body grows longer.\n"+
    "However, if its head touches other parts of the body, its body shrinks to initial length.\n"+
    "If its head hits any edge of the window, the game is over.\n"+
    "Select from these 3 game difficulty: ";

  textAlign(CENTER);
  textSize(13);
  fill(0);
  text(instruction, width/2, height/6);

  // Options:
  rectMode(CORNER);
  // Easy
  stroke(0);
  fill(0);
  rect(width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("EASY", 2*width/12, 8 *height/14);

  // Moderate
  fill(0);
  rect(5*width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("MODERATE", 6*width/12, 8 *height/14);

  // Hard
  fill(0);
  rect(9*width/12, height/2, 2*width/12, height/7);
  fill(255);
  text("HARD", 10*width/12, 8 *height/14);
}

void mousePressed() {

  if (!play && gameOver) {    // If mouse is pressed and game has not started

    if (width/12<=mouseX && mouseX<=3*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Easy difficulty chosen
      frameRate(easyDifficulty);
      play=true;
      gameOver=false;
      menu=false;
    }

    if (5*width/12<=mouseX && mouseX<=7*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Moderate difficulty chosen, 2times harder than Easy Mode
      frameRate(2*easyDifficulty);
      play=true;
      gameOver= false;
      menu=false;
    }

    if (9*width/12<=mouseX && mouseX<=11*width/12 && height/2<=mouseY && mouseY<=9*height/14) {
      // Hard difficulty chosen, 2 times harder than moderate
      frameRate(2*2*easyDifficulty);
      play=true;
      gameOver= false;
      menu=false;
    }
  }
}
