public class Start {
  int x, y;
  int r = 10;
  public Start() {
    put(10,10);
  }
  public void put(int x, int y) {
    this.x = x;
    this.y = y;
    this.reset();
  }
  public void reset(){
    ball_x = x;
    ball_y = y;
    ball_status = "nomal";
  }
  public void draw() {
    fill(0,0,100);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
    textFont(font,18);
    text("start", x-20, y+25);
  }
}

