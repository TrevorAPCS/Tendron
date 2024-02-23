public class Cluster
{
    public final static int NUM_STEMS = 7; //number of tendrils per cluster
    private Tendril[] tendrils = new Tendril[NUM_STEMS];
    int c;

    public Cluster(int len, int x, int y, int z)
    {
      double angleVal = 0;
      if(len == START){
        c = colors[0];
      }
      else if(len == START / 3){
        c = colors[1];
      }
      else{
        c = colors[2];
      }
      for(int i = 0; i < tendrils.length; i++){
        tendrils[i] = new Tendril(len, angleVal, x, y, z, c);
        angleVal += (2*Math.PI / NUM_STEMS);
      }
    }
    public void show(){
      for(int i = 0; i < tendrils.length; i++){
        tendrils[i].show();
      }
    }
}
