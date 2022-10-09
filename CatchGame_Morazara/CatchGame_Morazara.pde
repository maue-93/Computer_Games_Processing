boolean play=false; // a variable to be true only once the user selected to play
int score= 0; // to keep track of score
Block[] block= new Block[5]; // declare the blocks

CircleRectangle[] popCR= new CircleRectangle[10]; // declare the circles or rectangles for background

void setup() {
  size (800, 800);

  // Loop to initialize the blocks
  for (int i=0; i<5; i++) {
    block[i]= new Block();
    block[i].initialize();
  }
  // Loop to initialize the circles or rectangles
  for (int i=0; i<10; i++) {
    popCR[i]= new CircleRectangle();
    popCR[i].initialize();
  }
}


void draw() {
  // display background 
  background(0);

  for (int i=0; i<10; i++) {
    popCR[i].display();
    popCR[i].fadeAway();
  }

  if (play) {
    // If the user choose to play

    // Loop to display and move the blocks, and to keep track of score and speed
    for (int i=0; i<5; i++) {
      block[i].display();
      block[i].move();
      block[i].scoreAndSpeed();
    }

    displayPaddle(); 

    // Display score
    fill(255);
    textSize(20);
    text("Score= "+score, 60, 20);
  } else {
    // First page
    String instruction;

    instruction="CATCH GAME\n"+
      "5 squares of random sizes move from the left to the right.\n"+
      "There is a paddle to the right side of window that user can move up and down with the mouse.\n"+
      "Everytime the paddle hits a square, the square disappears,\n the score goes up and so does the speed of the squares.\n"+
      "Everytime a square hit the right edge of the window, the square disappears,\n score goes down and so does the speed.\n"+
      "The speed is held at initial if score is equal or less than zero.";

    textAlign(CENTER);
    textSize(15);
    fill(255);
    text(instruction, width/2, height/6);

    rectMode(CORNER);


    // Play button
    stroke(255);
    fill(0);
    rect(2*width/14, height/2, 3*width/14, height/7);
    fill(255);
    text("PLAY", 7*width/28, 8 *height/14);

    // Exit button
    fill(0);
    rect(9*width/14, height/2, 3*width/14, height/7);
    fill(255);
    text("EXIT", 21*width/28, 8 *height/14);
  }
}

void mousePressed() {

  if (!play) {    // If mouse is pressed and game has not started

    if (2*width/14<=mouseX && mouseX<=5*width/14 && height/2<=mouseY && mouseY<=9*height/14) {
      // If user choose to play
      play=true;
    }

    if (9*width/14<=mouseX && mouseX<=12*width/14 && height/2<=mouseY && mouseY<=9*height/14) {
      // If user choose to exit
      exit();
    }
  }
}