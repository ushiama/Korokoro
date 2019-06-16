// センサ値取得用変数
int ax = 0; // x方向加速度
int ay = 0; // y方向加速度
int az = 0; // z方向加速度
int vol = 0; // ボリューム

//ボール
int ball_x = 0;// x 位置
int ball_y = 0;// y 位置
float v_x = 0; // x 速度
float v_y = 0; // y 速度
int ball_r = 5; //ボールの半径
String ball_status = "nomal"; //ボールの状態

PFont font;

Field myField;
Timer myWatch = new Timer();

//初期化（最初に１回だけ呼び出される）
void setup() {
  size(400, 500);//ウインドウを作成
  colorMode(RGB, 100);//色の指定方法、RGB,各色 0～100
  smooth();//輪郭を滑らかに
  //画面に表示する文字の種類（フォント）の設定
  font = loadFont("ArialMT-18.vlw");
  textFont(font, 18);
  //センサデバイスの初期化
  initDevice();

  // フィールド作成
  myField = new Field();

  //■■■　フィールドに障害物を設置　■■■
  //スタートを設置
  myField.putStart(30, 20);
  //ゴールを作成
  myField.makeGoal(320, 390);
  //穴を作成
  myField.makeHole(30, 110);
  myField.makeHole(100, 70);
  myField.makeHole(190, 130);
  myField.makeHole(210, 200);
  myField.makeHole(30, 340);
  myField.makeHole(170, 300);
  myField.makeHole(300, 350);

  //ブロックを作成
  myField.makeBlock(150, 50, 250, 20);
  myField.makeBlock(0, 140, 200, 10);
  myField.makeBlock(250, 140, 150, 10);
  myField.makeBlock(100, 250, 300, 30);


  //時間計測開始
  myWatch.start();
}

//一定時間ごとに繰り返し呼び出される
void draw() {
  //背景を塗る
  background(50, 50, 50);
  fill(100,100,100);
  rect(0,height-100,width,100);
  //フィールドの描画
  myField.draw(); 

  //状況ボールのにあわせた動作
  if (ball_status == "hitGoal") {//ゴールと接しているとき
    myWatch.stop();//時計を止める
    //画面上に文字を表示
    fill(100, 100, 100);
    textFont(font, 48);
    text("Gooooooooal!!", 50, 200);
    textFont(font, 18);
  } else if (myWatch.isGameOver() == true) {
    myWatch.stop();//時計を止める
    //画面上に文字を表示
    fill(100, 100, 100);
    textFont(font, 48);
    text("Game Over!!", 50, 200);
    textFont(font, 18);
  } else if (ball_status == "hitHole") {//穴と接しているとき
    myField.goStart();//ボールをスタート位置に戻す
  } 
  else {//それ以外
    //ボールをコントロールする方法を選択 (いずれか一つだけコメントを外す)
    //move_ball1();
    move_ball2();
    //move_ball3();
    //キーボードでコントロール場合は，以下のコメントを外す
    keyCheck();
  }

  //時刻表示
  myWatch.draw();

  //ボールを描く
  fill(100, 100, 100);
  ellipseMode(RADIUS);
  ellipse(ball_x, ball_y, ball_r, ball_r);

  //棒グラフの表示
  showBarGraph();
}
//ボールを動かす関数
void move_ball1() {
  //x方向のチェック
  if ( ax > 0) {
    //右
    ball_x = ball_x + 1;
    if (myField.hitCheck() == true) {
      ball_x = ball_x - 1;
    }
  }
  if ( ax < 0) {
    ball_x = ball_x - 1;
    if (myField.hitCheck() == true) {    
      ball_x = ball_x + 1;
    }
  }  
  //y方向チェック
  if ( ay > 0) {
    //右
    ball_y = ball_y - 1; 
    if (myField.hitCheck() == true) {
      ball_y = ball_y + 1;
    }
  }
  if ( ay < 0) {
    ball_y = ball_y + 1;
    if (myField.hitCheck() == true) {
      ball_y = ball_y - 1;
    }
  }
}

//ボールを動かす関数2
void move_ball2() {
  int add_x, add_y;
  add_x = ax/5;
  add_y = -ay/5;
  //x方向のチェック
  ball_x = ball_x + add_x;
  if (myField.hitCheck() == true) {
    ball_x = ball_x - add_x;
  }
  //y方向チェック
  ball_y = ball_y + add_y; 
  if (myField.hitCheck() == true) {
    ball_y = ball_y - add_y;
  }
}

//ボールを動かす関数3
void move_ball3() {

  float add_x, add_y;
  add_x = float(ax)/100.0;
  add_y = -float(ay)/100.0;
  v_x = v_x + add_x;
  v_y = v_y + add_y;
  
  //x方向のチェック
  ball_x = ball_x + int(v_x);
  if (myField.hitCheck() == true) {
    ball_x = ball_x - int(v_x);
    v_x = 0;
  }
  //y方向チェック
  //右
  ball_y = ball_y + int(v_y); 
  if (myField.hitCheck() == true) {
    ball_y = ball_y - int(v_y);
    v_y = 0;
  }
}

