public class Hole {
  int x, y;
  int r;
  public Hole(int x, int y, int r){
    this.x = x;
    this.y = y;
    this.r = r;
  }
  public Hole(int x, int y){
    this.x = x;
    this.y = y;
    this.r = 7;
  }
  public void draw(){
     fill(0,0,0);
     noStroke();
     ellipseMode(RADIUS);
     ellipse(x, y, r, r);
  }
  public boolean hitCheck(){
    float d = dist(x, y, ball_x, ball_y);
    if (d <= r){
      println("fall");
      
      ball_status = "hitHole";
      ball_x = x;
      ball_y = y;
      return true;
    } else {
      return false;
    }
  }
}
