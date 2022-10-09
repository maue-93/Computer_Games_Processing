
int nCol; // Number of Columns
int nRow; // Number of Rows

int nMine; // Number of Mines

  int nFlag=0; // Number of flags
  int nOpen=0; // Number of Opened grids

PImage mine;
PImage flag;
PImage flagX;

float gridW;
float gridH;

boolean play; // When Game is Playing
boolean win; // True if player wins the game
boolean gameOver; // True if player loses the game

//Declare grids
Grid[][] grid= new Grid [30][30]; // Declare 30 by 30 because for this game, the maximum is 30 by 30. After the player choose the size, the program will only use the necessary size. 

void setup() {
  size(600, 600);

  strokeWeight(1); // Stroke between Grids

}


void draw() {
  background(109);

  if (play) {

    for (int i=0; i<nCol; i++) {
      for (int o=0; o<nRow; o++) {
        grid[i][o].display();
        // Do not allow any click if game is over or game is won
        if (!(gameOver || win)) {
          grid[i][o].mouseClick(); // Allows player to click on a grid
        }
      }
    }

    // Check if game is complete 
    gameComplete();
    // Check if the player won
    winPage(win);
    // Check if game over
    gameOverPage(gameOver);
  }

  else {
    instructionPage(); // Display Menu Page
  }
}
