// Animation space is a square 
float animationS; // width of the space
float tlX; // Top Left x position of the space
float tlY; // Top Left Y position of the space
float shapeS; // animation shape Size

// x determinant of shape
//int[][] xD= { {4, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6}, {8, 8, 8, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11}, {13, 13, 13, 13, 13, 13, 14, 14, 15, 15, 16, 16, 16, 16, 16, 16}, {18, 18, 18, 19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21}, {23, 23, 23, 23, 23, 24, 24, 24, 25, 25, 25, 25, 25} }; 
//int[][] yD= { {12, 13, 14, 16, 17, 12, 14, 17, 12, 14, 15, 16, 17}, {12, 13, 14, 15, 16, 17, 12, 17, 15, 17, 15, 16, 17}, {12, 13, 14, 15, 16, 17, 16, 17, 16, 17, 12, 13, 14, 15, 16, 17}, {12, 13, 14, 14, 15, 16, 17, 14, 15, 16, 17, 12, 13, 14}, {12, 13, 14, 15, 17, 12, 15, 17, 12, 13, 15, 16, 17} };
int[] xD= { 4, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6, 8, 8, 8, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 13, 13, 13, 13, 13, 13, 14, 14, 15, 15, 16, 16, 16, 16, 16, 16, 18, 18, 18, 19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21, 23, 23, 23, 23, 23, 24, 24, 24, 25, 25, 25, 25, 25 }; 
int[] yD= { 12, 13, 14, 16, 17, 12, 14, 17, 12, 14, 15, 16, 17, 12, 13, 14, 15, 16, 17, 12, 17, 12, 15, 17, 15, 16, 17, 12, 13, 14, 15, 16, 17, 16, 17, 16, 17, 12, 13, 14, 15, 16, 17, 12, 13, 14, 14, 15, 16, 17, 14, 15, 16, 17, 12, 13, 14, 12, 13, 14, 15, 17, 12, 15, 17, 12, 13, 15, 16, 17 }; 


void animationSizeLocation () { // to call before instantiating Shape 
  tlX=0; // initialiaze as 0 and only change under specific condition
  tlY=0; // initialiaze as 0 and only change under specific condition
  if (width<height) { 
    tlY=(height-width)/2; // Adjust tlY
    animationS=width;
  } else if  (width>height) {
    tlX=(width-height)/2; // adjust tlX  
    animationS=height;
  } else {
    animationS= width;
  }
  shapeS= animationS/30; // adjust shapS

  // Instanciate shape objects
  for (int i=0; i<70; i++) {
    shape[i]= new Shape(i);
  }
} // animationSizeLocation