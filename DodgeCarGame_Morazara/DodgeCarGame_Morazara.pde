boolean play=false;

Circle[] popCircle= new Circle[10]; // declare the circles for background


int numberOfCars= 4;

int a= 2; // Index before i index a= i-1

// Declare Cars
Car[] car= new Car[numberOfCars];

void setup() {
  size (500, 800);

  manSize=width/6 - 8; // Initiate manSize

  // Randomize initial x position of Man
  if (((int) random(0, 5))%2==0 ) {
    manX= 5*width/12;
  } else {
    manX=7*width/12;
  }
  // initiate a constant y position of Man
  manY= height- 3*manSize;

  carWidth= width/6;

  // Initialize min and max vertical distance between cars
  minDistance= manSize+ 40 ; 
  maxDistance= manSize+ 80 ;

  // Initiate cars
  // Initiate first array
  car[0]= new Car();
  car[0].initialize();
  car[0].carY= car[0].distance + car[0].carLength/2 ;

  // adjust distance
  for (int i=1; i< numberOfCars; i++) {
    car[i]= new Car();
    car[i].initialize();
    car[i].carY= car[i-1].carY - car[i-1].carLength/2 -car[i-1].distance - car[i].carLength/2;
  }

  // Loop to initialize the circles
  for (int i=0; i<10; i++) {
    popCircle[i]= new Circle();
    popCircle[i].initialize();
  }
}

void draw() {

  background(0);

  for (int i=0; i<10; i++) {
    popCircle[i].display();
    popCircle[i].fadeAway();
  }


  if (play) {
    // Draw the path
    rectMode(CORNER);
    fill(255);
    rect(width/3 - 10, 0, width/3 + 20, height);

    for (int i=0; i< numberOfCars; i++) {
      car[i].display();
      car[i].move();
      car[i].score();
      
      car[i].throughBottom();
      a=i-1;
      if (a==-1) {
        a= numberOfCars-1;
      }
      if (car[i].onceThrough && ( car[a].carY- car[a].carLength/2 >= car[a].distance )) {

        car[i].initialize();
      }
    }

    displayMan ();

    // Display score
    fill(255);
    textSize(20);
    text("Score= "+score, 60, 20);
  } else {

    // First page
    String instruction;

    instruction="DODGE CARS GAME\n"+
      "Cars of random length move from the top to the bottom.\n"+
      "Press A to move to the left and D to the right.\n"+
      "Everytime you hit a car, it disappears\n the score goes down and so does the speed of the cars.\n"+
      "Everytime you dodge a car \n and it goes through the bottom of the window,\n score goes up and so does the speed.\n"+
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