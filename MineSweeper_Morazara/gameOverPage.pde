void gameOverPage(boolean gameOverTest) {
  if (gameOverTest) {
    // Display all Mines
    for (int i=0; i<nCol; i++) {
      for (int o=0; o<nRow; o++) {
        if ( !grid[i][o].open) { // If Grid not opened
          if (!grid[i][o].flagOn) { // If not flagged on
            if (grid[i][o].neiM==-1) { //If Grid contains mine
              grid[i][o].open= true;
            }
          } else if (grid[i][o].neiM!=-1) { //if flaggd on but does not contain Mine
            grid[i][o].flagOn=false; // Take the flag out
            grid[i][o].flagError= true; // because It is a flag error and put FlagX on
          }
        }
      }
    }

    // Display GAME OVER and instruction at the center 
    // Put a rectangle background
    rectMode(CENTER);
    fill(255, 90);
    rect(width/2, height/2, width/2, height/5);
    // Display the text
    textAlign(CENTER, CENTER);
    textSize(height/32);
    fill(255,0,0);
    text("GAME OVER \n Press M to go back to the Menu", width/2, height/2);
  }
}
