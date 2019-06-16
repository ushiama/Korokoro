public class Field {
  private Hole holes[];
  private int numHoles;
  private Goal goals[];
  private int numGoals;
  private Block blocks[];
  private int numBlocks;
  private Start myStart;
  
  //コンストラクタ
  public Field() {
    holes = new Hole[100];
    this.numHoles = 0;
    goals = new Goal[100];
    this.numGoals = 0;
    blocks = new Block[100];
    this.numBlocks = 0;
    myStart = new Start();
  }
  //穴を作る
  public void makeHole(int x, int y) {
    holes[numHoles] = new Hole(x, y);
    numHoles++;
    return;
  }
  //ゴールを作る
  public void makeGoal(int x, int y) {
    goals[numGoals] = new Goal(x, y);
    numGoals++;
    return;
  }
  //ブロックを作る
  public void makeBlock(int x, int y, int w, int h) {
    blocks[numBlocks] = new Block(x, y, w, h);
    numBlocks++;
    return;
  }
  public void putStart(int x, int y){
    myStart.put(x, y);
  }
  // フィールド上のオブジェクトを描画する
  public void draw() {
    for (int i = 0; i < numBlocks; i++) {
      blocks[i].draw();
    }
    for (int i = 0; i < numHoles; i++) {
      holes[i].draw();
    }
    for (int i = 0; i < numGoals; i++) {
      goals[i].draw();
    }
    myStart.draw();
  }
  //あたり判定
  public boolean hitCheck() {
    boolean hitFlag = false;
    for (int i = 0; i < numHoles; i++) {
      if (holes[i].hitCheck() == true) {
        hitFlag = true;
      }
    }
    for (int i = 0; i < numGoals; i++) {
      if (goals[i].hitCheck() == true) {
        hitFlag = true;
      }
    }
    for (int i = 0; i < numBlocks; i++) {
      if (blocks[i].hitCheck() == true) {
        hitFlag = true;
      }
    }
    //壁との衝突
    if (checkEdge() == true ) {
      hitFlag = true;
    }
    return hitFlag;
  }
  //壁との衝突判定
  boolean checkEdge() {
    if( ball_x - ball_r <= 0 ||
      ball_x + ball_r >= width ||
      ball_y - ball_r <= 0 ||
      ball_y + ball_r >= height - 100) {
      ball_status = "hitEdge";   
      return true;
    } 
    else {
      return false;
    }
  }
  public void goStart(){
    myStart.reset();
  }
}

