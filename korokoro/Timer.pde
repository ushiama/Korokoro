public class Timer {
  int start_mi, start_s, start_m, start_h, start_t;
  int mi = 0;
  int s = 0;
  int m = 0;
  int h = 0;
  int rest = 0;
  int play_t = 60000;
  boolean stopFlag;
  public Timer() {
    start_mi = millis();
    start_s = second();
    start_m = minute();
    start_h = hour();
    stopFlag = false;
    start_t = millis();
    rest = play_t;
  }
  public void start() {
    start_mi = millis() % 1000;
    start_s = second();
    start_m = minute();
    start_h = hour();
    start_t = millis();
    stopFlag = false;
    rest = play_t;
    //println("stopwatch: start");
  }
  public void stop() {
    stopFlag = true;
    //println("stopwatch: stop");
  }
  public boolean isGameOver() {
    if (rest <= 0) {
      stop();
      rest = 0;
      stopFlag = true;
      return true;
    } else {
      return false;
    }
  }
  public void draw() {
    if (stopFlag == false) {
    /*
      mi = (millis() % 1000) - start_mi;
      s = second() - start_s;
      m = minute() - start_m;
      h = hour() - start_h;
      if (mi < 0) {
        mi += 1000;
      }
      if (s < 0) {
        s += 60;
        m -= 1;
      }
      if (m < 0) {
        m += 60;
        h -= 1;
      }
      if (h < 0) {
        h += 24;
      }
    */
      rest = play_t - (millis()-start_t);
    }
    fill(0,0,0);
    //text("time "+ m + ":" + s + ":" + mi/100, 280,395);
    text("rest: "+ rest / 1000, width - 60, height - 85);
    //println("stopflag="+stopFlag);
    //println(rest);
    rectMode(CORNER);
    fill(0,0,0);
    rect(0,height-100,width - 66 , 15);
    fill(100,0,0);
    rect(0,height-100,(width - 66) * rest / play_t ,15);

  }
}

