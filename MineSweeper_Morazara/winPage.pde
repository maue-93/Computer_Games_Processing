void winPage(boolean winTest) { // To be called if player wins game
  if (winTest) {
    // Display YOU WIN !! and instruction at the center 
    // Put a rectangle background
    rectMode(CENTER);
    fill(255, 200);
    rect(width/2, height/2, width/2, height/5);
    // Display the text
    textAlign(CENTER, CENTER);
    textSize(height/32);
    fill(0,255,0);
    text("YOU WON !! \n Press M to go back to the Menu", width/2, height/2);
  }
}
