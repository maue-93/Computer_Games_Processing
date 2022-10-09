class Grid {
  int colN; // Column number
  int rowN; // Row number

  int neiM; // Number of neighbor mines; -1 if grid contains a mine

  boolean open; // True when to display what's in a grid
  boolean flagOn; // True if player chooses to click left when grid not opened
  boolean flagError; // True if Grid flagged on but do not contain Mine; only to be checked when game is finished

  int transp; // Transparency of Grid color

  Grid(int colN, int rowN) {
    this.colN= colN;
    this.rowN= rowN;
  }

  void display() {

    rectMode(CORNER);
    imageMode(CORNER);

    // To alter transp
    if (colN%2==0 ^ rowN%2==0) {
      transp=70;
    } else {
      transp=200;
    }


    if (open) { 
      if (neiM==-1) {
        fill(255, 0, 0, transp);

        rect(colN*gridW, rowN*gridH, gridW, gridH);

        image(mine, colN*gridW, rowN*gridH);
      } else {
        fill(200);
        rect(colN*gridW, rowN*gridH, gridW, gridH);

        textAlign(CENTER, CENTER);
        // Make text same color as rectangle if neiM=0
        if (neiM!=0) {
          fill(0);
        }
        textSize((int)(gridW)); // To be reviewed
        text(neiM, colN*gridW +gridW/2, rowN*gridH+3*gridH/8);
      }
    } else {
      // Display initial rectangle
      fill(0, 255, 0, transp);
      rect(colN*gridW, rowN*gridH, gridW, gridH);

      if (flagOn) { // If flag should display
        image(flag, colN*gridW, rowN*gridH);
      } else if (flagError) {
        image(flagX, colN*gridW, rowN*gridH);
      }
    }
  }//display


  void mouseClick() {
    if (mousePressed && colN*gridW< mouseX && mouseX<colN*gridW+gridW && rowN*gridH< mouseY && mouseY<rowN*gridH+gridH) { // If mousePressed inside Grid
      if (!open) { // Only execute if Grid not opened yet
        switch (mouseButton) {
        case LEFT: 

          if (!flagOn) {
            open= true; // Open Grid
            ifOpen0(colN, rowN); // If it is 0 then it will open grids around 0 recursively
            if (neiM==-1) {
              gameOver= true;
            }
          }
          break;

        case RIGHT:
          if (nFlag>=nMine) {// If number of flagged grids is greater than or equal to number of Mines
            flagOn=false; // All player can do is cancel flag but never to add flags
            delay(100);
          } else {
            flagOn=!flagOn; 
            delay(100);
          }

          break;
        }
      }
    }
  }
} 
