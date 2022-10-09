void gameComplete() {
  nFlag=0; // Number of flags, set to zero before counting
  nOpen=0; // Number of Opened grids, set to zero before counting
  // Count number of flags
  for (int i=0; i<nCol; i++) {
    for (int o=0; o<nRow; o++) {
      if (grid[i][o].flagOn) {
        nFlag= nFlag+ 1;
      }
      if (grid[i][o].open) {
        nOpen= nOpen+ 1;
      }
    }
  }

  if (nFlag==nMine && nOpen+nFlag==nCol*nRow && !gameOver && !win) { // If number of flag is equal to number of mines, and number of opened grids plus plagges is the total number of grids and game is not over and game not won

    // Test if any of the flagged grids do not contain mines
    for (int i=0; i<nCol; i++) {
      for (int o=0; o<nRow; o++) {
        if ( grid[i][o].flagOn && grid[i][o].neiM!=-1) { // if flagged and do not contain mine
          gameOver=true; // game is over
        }
      }
    }
    if (!gameOver) { // If after the test, game is not over
      win=true; // Game is now won
    }
  }
}
