float paddleX; // x position of the paddle
float paddleY; // y position of the paddle
float paddleWidth=30; 
float paddleHeight=150;

void displayPaddle() {
  paddleX= width-30; // hold x position constant
  paddleY= constrain(mouseY, paddleHeight/2, height-paddleHeight/2); // Constrain paddle within window
  fill(255);
  rectMode(CENTER); 
  rect(paddleX, paddleY, paddleWidth, paddleHeight); // Draw paddle
}