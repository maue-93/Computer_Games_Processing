float minDistance; // minimum vertical distance between cars
float maxDistance; // maximum vertical distance between cars

float carWidth;

float mincarLength= 60; // minimum length for randomization
float maxcarLength= 200; // maximum length for randomization

int score=0;
float speed=1;

class Car {

  float distance; //vertical distance

  float carLength;


  float carX;
  float carY;

  boolean touch;

  boolean once; // once score changes
  
  boolean onceThrough; // once car goes throught bottom edge of window

  void initialize() {

    touch=false;

    distance= random(minDistance, maxDistance);// Random vertical distance 

    carLength= random(mincarLength, maxcarLength); // Randomize Car length

    // Randomize side of Car
    if (((int) random(0, 5))%2==0 ) {
      carX= 5*width/12;
    } else {
      carX=7*width/12;
    }

    carY= -carLength/2;

    once= false;
    
    onceThrough= false;
  }


  void display () {
    if (!once) {
      fill(0);
      rectMode(CENTER);
      rect(carX, carY, carWidth, carLength);
    }
  }

  void move () {
    // Update speed in function of score
    if (0<score) {
      speed= 1 + score/10.0;
    } else {
      speed= 1;
    }

    // move Car
    carY= carY + speed;
  }

  void score() {
    // Car go through bottom window
    if (height<= carY- carLength/2 && !once) {
      score= score+1;
    }

    // Car hits Man 
    touch= abs(carX- manX)==0 && ( ( (carY-carLength/2)<(manY-manSize/2) && (manY-manSize/2)<(carY+carLength/2) ) || ( (carY-carLength/2)<(manY+manSize/2) && (manY+manSize/2)<(carY+carLength/2) ) );
    if (touch && !once) { // If Car hit Man, 
      score= score-1; // score goes down
      once= true;
    }
  }

  void throughBottom () {
    if (height<= carY- carLength/2) {
      once=true;
      onceThrough= true;
    }
  }
}

// Check from x position first