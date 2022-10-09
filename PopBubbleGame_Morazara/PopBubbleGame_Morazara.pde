boolean play=false; // a variable to be true only once the user selected to play
int score= 0; // to keep track of score

Bubble[] bubble= new Bubble[5]; // declare the bubbles

int numberOfRows=200;

//declare rows 
Row[] row= new Row[numberOfRows];


void setup() {
  size (800, 800);

  // Loop to initialize the bubbles
  for (int i=0; i<5; i++) {
    bubble[i]= new Bubble();
    bubble[i].initialize();
  }
  // initiate rows
  for (int rowNumber=numberOfRows-1; 0<=rowNumber; rowNumber--) {
    row[rowNumber]= new Row(rowNumber);
    row[rowNumber].initialize();
  }
}


void draw() {
  // draw background
  background(0);
  for (int rowNumber=1; rowNumber<numberOfRows; rowNumber++) {
    row[rowNumber].display();
    row[rowNumber].fadeAway();
  }

  if (play) {
    // If the user choose to play

    // Loop to display, move and jitter the bubbles, and to keep track of score and speed
    for (int i=0; i<5; i++) {
      bubble[i].display();
      bubble[i].moveAndJitter ();
      bubble[i].scoreAndSpeed();
    }
    // Display score
    fill(255);
    textSize(20);
    text("Score= "+score, 60, 20);
  } else {
    // First page
    String instruction;

    instruction="POP BUBBLE GAME\n"+
      "5 bubbles of random sizes move from the bottom to the top.\n"+
      "You can POP the Bubbles by mouse-pressing them if the mouse is pointed inside them.\n"+
      "Everytime a bubbble is popped, the bubble disappears,\n the score goes up and so does the speed of the bubbles.\n"+
      "Everytime a bubbles hit the top edge of the window, the bubble disappears,\n score goes down and so does the speed.\n"+
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

  if (!play) {   // If mouse is pressed and game has not started
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