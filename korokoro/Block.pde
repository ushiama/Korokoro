public class Block {
  int x1, y1, x2, y2,w, h;
  public Block(int x, int y, int w, int h) {
    this.x1 = x;
    this.y1 = y;
    this.x2 = x + w;
    this.y2 = y + h;
    this.w = w;
    this.h = h;
  }
  public Block(int x1, int y1) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x1 + 10;
    this.y2 = y2 + 10;
  }
  public void draw() {
    fill(0,50,0);
    noStroke();
    rectMode(CORNERS);
    rect(x1, y1, x2, y2);
  }
  public boolean hitCheck() {
    if ( x1 <= ball_x + ball_r &&
      ball_x - ball_r <= x2 &&
      y1 <= ball_y + ball_r &&
      ball_y - ball_r <= y2) {
      ball_status = "hitBlock";
      return true;
    } 
    else {
      return false;
    }
  }
}

