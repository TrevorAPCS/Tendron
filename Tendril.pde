public class Tendril {
  public final static int SEG_LENGTH = 6; //length of each segment in the tendril
  private int myX, myY, myZ, myNumSegments, myColor, num;
  private int[] xPos, yPos, zPos;
  private double myAngle;
  private Cluster c;
  
  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y, int z, int c)
  {
    myX = x;
    myY = y;
    myZ = z;
    myAngle = theta;
    myNumSegments = len;
    xPos = new int[myNumSegments];
    yPos = new int[myNumSegments];
    zPos = new int[myNumSegments];
    xPos[0] = myX;
    yPos[0] = myY;
    zPos[0] = myZ;
    calculateTendril(myNumSegments - 1, myX, myY, myZ);
    myColor = c;
  }
  private void calculateTendril(int t, int px, int py, int pz)
  {
    if(t > 0){
      myAngle += Math.random() * 0.4 - 0.2;
      int nx = px + (int)(SEG_LENGTH * Math.cos(myAngle));
      int ny = py + (int)(SEG_LENGTH * Math.sin(myAngle));
      int nz = pz + (int)(Math.random() * SEG_LENGTH);
      xPos[myNumSegments - t] = nx;
      yPos[myNumSegments - t] = ny;
      zPos[myNumSegments - t] = nz;
      calculateTendril(t - 1, nx, ny, nz);
    }
    else{
      if(myNumSegments > 3){
        c = new Cluster(myNumSegments / 3, px, py, pz);
      }
    }
  }
  public void show(){
    drawLines(0);
    if(c != null){
      c.show();
    }
  }
  private void drawLines(int t){
    stroke(myColor);
    if(t < myNumSegments - 1){
      line(xPos[t], yPos[t], zPos[t], xPos[t+1], yPos[t+1], zPos[t + 1]);
      drawLines(t + 1);
    }
  }
}
