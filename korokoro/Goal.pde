public class Goal {
  int x, y;
  int r;
  public Goal(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  public Goal(int x, int y) {
    this.x = x;
    this.y = y;
    this.r = 7;
  }
  public void draw() {
    fill(100,0,0);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
    text("goal", x - 20, y - 15);
  }
  public boolean hitCheck() {
    float d = dist(x, y, ball_x, ball_y);
    if (d <= r) {
      println("Goal");
      ball_status = "hitGoal";
      ball_x = x;
      ball_y = y;
      return true;
    } else {
       return false;
    }
  }
}

