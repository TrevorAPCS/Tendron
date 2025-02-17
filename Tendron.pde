private Cluster c;
private float ryValue;
private float rxValue;
public static final int START = 50;
public int[] colors = {#FF0000, #F6FF00, #00FF1B};

boolean paused = false;
public void setup()
{
  size(1000, 1000, P3D);  
  reSetup();
}

public void draw()
{
  background(255);
  translate(500, 500, -500);
  rotateY(ryValue);
  noFill();
  stroke(0);
  box(700);
  c.show();
  rotateY(-ryValue);
  translate(-125, -250, 250);
  if(!paused)
    ryValue += Math.PI/64;
}

public void mousePressed(){
  if(mouseButton == LEFT)
    reSetup();
  else
    paused = !paused;
}
public void reSetup(){
  c = new Cluster(START, 0, 0, 0);
}
