// キーボードチェック
void keyCheck() {
  if (keyPressed == true && key == CODED) {
    if (keyCode == UP) {
      ball_y -= 1;
      if (myField.hitCheck() == true) {
        ball_y += 1;
      }
    } 
    else if (keyCode == DOWN) {
      ball_y += 1;
      if (myField.hitCheck() == true) {
        ball_y -= 1;
      }
    } 
    if (keyCode == RIGHT) {
      ball_x += 1;
      if (myField.hitCheck() == true) {
        ball_x -= 1;
      }
    } 
    else if (keyCode == LEFT) {
      ball_x -= 1;
      if (myField.hitCheck() == true) {
        ball_x += 1;
      }
    }
  }
}

