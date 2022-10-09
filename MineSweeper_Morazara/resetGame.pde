void resetGame(int n) { // To be called after player chooses a number,  Number of Mine as input
  nMine=n; //assign n to nMine

  play= false;
  win= false;
  gameOver=false;

  // The game is set at nMine x nMine 
  nCol= nMine; 
  nRow= nMine;

  //  Initialize grid size
  gridW= width/nCol;
  gridH= height/nRow;

  // Upload and resize mine and flag and flagX images
  mine= loadImage("Mine.png");   
  mine.resize((int)gridW, (int)gridH);
  flag= loadImage("Flag.png");   
  flag.resize((int)gridW, (int)gridH);
  flagX= loadImage("FlagX.png");   
  flagX.resize((int)gridW, (int)gridH);

  // Create grids
  for (int i=0; i<nCol; i++) {
    for (int o=0; o<nRow; o++) {
      grid[i][o]= new Grid(i, o);
    }
  }

  int nMineSet=0; // Number of Mines set; for the randomization purpose only
  // Set Mines
  while (nMineSet<nMine) { // Stop when all mines are set
    int randCol; // Random column number
    int randRow; // Random row number

    randCol= (int) random(nCol-0.01); // The minus 0.01 is to give a fair probbility to nCol-1 and to avoid getting nCol as columns range from 0 to nCol-1
    randRow= (int) random(nRow-0.01); // The minus 0.01 is to give a fair probbility to nRow-1 and to avoid getting nRow as rows range from 0 to nRow-1

    if (grid[randCol][randRow].neiM!=-1) {
      grid[randCol][randRow].neiM=-1;
      nMineSet+=1;
    }
  }//While

  // Counting neighboring mines
  for (int i=0; i<nCol; i++) {
    for (int o=0; o<nRow; o++) {
      if (grid[i][o].neiM!=-1) {
        for (int p=i-1; p<=i+1; p++) {
          for (int q=o-1; q<=o+1; q++) {
            if (0<=p && p<nCol && 0<=q && q<nRow && grid[p][q].neiM==-1) {
              grid[i][o].neiM=grid[i][o].neiM+1;
            }//if2
          }//for4
        }//for3
      }//if1
    }//for2
  }//for1
}// reset Game
