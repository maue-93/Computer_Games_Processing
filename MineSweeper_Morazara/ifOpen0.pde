void ifOpen0(int colN, int rowN) {

  if (grid[colN][rowN].open && grid[colN][rowN].neiM==0) { // if Grid is opened and it has 0 neighboring mines
    for (int i=colN-1; i<=colN+1; i++) {
      for (int o=rowN-1; o<=rowN+1; o++) {
        if (0<=i && i<nCol && 0<=o && o<nRow && !grid[i][o].open && !grid[i][o].flagOn) { // If in the range of column and row and Grid not opened and the flag is not on
          grid[i][o].open=true; // Open all neighboring Grid 
          ifOpen0(i, o); // and redo the test (function)
        }
      }
    }
  }
}
