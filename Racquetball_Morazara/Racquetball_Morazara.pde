int paddlex, paddley, paddleWidth, paddleHeight, paddleWidthFactor,
  ballx, bally, ballDiameter, speedx, speedy,
  score;
  
boolean paddleBall, verticalTouch, horizontalTouch, gameOver, gameStart= false, gameOn,
        smallPaddle, mediumPaddle, largePaddle;

void setup() {

  size (1000, 600);
    
}

void draw() {
  if (!mousePressed && !gameOver) {background (0);}

  if (gameOver) {
    textAlign(CENTER);
    text("Game Over. Press any key to START", width/2, height/2);}
    
    else {
      
      if (!gameStart) { 
        textAlign(CENTER, TOP);
        text("Choose paddle size \n Press S for Small Paddle" +
        "\n Press M for Medium Paddle \n Press L for Large Paddle"+
        "\n \n The larger the paddle, the faster the starting speed of the ball will be",
        width/2, height/40);
        text("S= 100, M=200, L=300", width/2, height/2);
        }
        else {
          
          gameOn=true;
          
          // Make the whole paddle stay in the window
          rectMode (CENTER);
          if (mouseX < paddleWidth/2) {paddlex= paddleWidth/2;} 
            else if (width - paddleWidth/2 < mouseX ) {paddlex= width - paddleWidth/2;} 
              else {paddlex= mouseX;}   
          // Draw paddle
          fill(255);
          rect(paddlex, paddley, paddleWidth, paddleHeight);
      
      
          // Pong Ball
          fill ((int)random(255), (int)random(255), (int)random(255));
          ellipse(ballx, bally, ballDiameter, ballDiameter);
      
          // When ball touches paddle
          paddleBall= (paddlex - paddleWidth/2 <= ballx) && (ballx <= paddlex + paddleWidth/2)
            && (abs(paddley - paddleHeight/2 - bally - ballDiameter/2) < speedy );
          // When ball touches the sides
          verticalTouch= (ballx <= ballDiameter/2) || (width - ballDiameter/2 <= ballx);
          // When ball touches the top or the paddle
          horizontalTouch= (bally <= ballDiameter/2) || paddleBall;
      
          // Keep track of score and speed increase
          if (paddleBall) {
            score+= 1;
            speedx= speedx + speedx / abs(speedx);
            speedy= speedy + speedy / abs(speedy);
          }
      
          // Display Score
          textSize (width/40);
          textAlign (LEFT, TOP);
          fill (255);
          text("Score= "+ score, 14*width/16, height/20);
      
          // Make ball bounce
          if (verticalTouch) {speedx= -speedx;} 
            else if (horizontalTouch) {speedy= -speedy;}
            
          // Make ball move
          ballx+= speedx;
          bally+= speedy;
          
          // Game Over when ball crosses the bottom edge of the window (To stop the play)
          if (bally> height) {gameOver= true; gameStart= false; gameOn= false;}
      }
  }
}

void keyPressed () {
  if (gameOver) {
    // To start over
    gameOver= false;   
    gameOn= false;}
    
    else{
      smallPaddle= (key== 'S') || (key== 's');
      mediumPaddle= (key== 'M') || (key== 'm');
      largePaddle= (key== 'L') || (key== 'l');
      gameStart= smallPaddle || mediumPaddle || largePaddle;
      
      if (smallPaddle) {paddleWidthFactor= 1;}
        else if (mediumPaddle) {paddleWidthFactor= 2;}
          else if (largePaddle) {paddleWidthFactor= 3;}
        
     
     if (!gameOver && gameStart && !gameOn) {
       
        paddleWidth= paddleWidthFactor*100;
        
        // Initiate Speed
        speedx= (int)pow(paddleWidthFactor, 2); // Horizontal speed
        speedy= (int)pow(paddleWidthFactor, 2); // Vertical speed
            
            
        // Initialize Score to 0
        score= 0; 
         
        // Initiate paddle position and height
        paddley= height - 40;
        paddleHeight= 20;
      
        // Initiate circle diameter
        ballDiameter= 26;
      
        // Initial random x coordinate for the ball
        ballx= (int) random(width/4, 3*width/4);
        // Initiate y coordinate for the ball to appear from the top of the window
        bally= 1 + ballDiameter/2;
      
        // To make ball go down randomly left or right
        if ((int)random(0, 200) % 2==0) {speedx= -speedx;}
     }
   }
}
