void keyPressed() {
  // When Game is Over or Won
  if (gameOver || win) {
    if (key=='M' || key=='m') {
      win=false;
      gameOver= false;
      play=false;
    }
  }
}
