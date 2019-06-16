//棒グラフを書く
void showBarGraph() {
  fill(50,50,50);
  rectMode(CORNER);
  rect(10 + (0 * 50), height-50, 40, ax);
  text(ax,15,height-60);
  rect(10 + (1 * 50), height-50, 40, ay);
  text(ay,15 + (1 * 50),height-60);
  rect(10 + (2 * 50), height-50, 40, az);
  text(az,15 + (2 * 50),height-60);
  //rect(10 + (3 * 50), 110, 40, vol);
  //text(vol,15 + (3 * 50),20);
}
