import processing.serial.*;

// Serialクラスのインスタンス
Serial myPort;

int max_val = 256;

void initDevice(){
  //通信用設定
  println("Available serial ports:");
  for(int i = 0; i < Serial.list().length; i++){
    println("[" + i + "]" + Serial.list()[i]); //リストの表示
  }
  String portName = Serial.list()[2]; //必要に応じて番号を変更
  // ポートとスピードを設定して、Serialクラスを初期化、
  myPort = new Serial(this, portName, 9600);

}

void serialEvent(Serial p){
    if(myPort.available() > 2){//データが3個以上到達しているとき
       int mid_val = max_val / 2;
      //シリアルポートからデータを読み込み
      ax = 100 * (myPort.read() - mid_val) / max_val;
      ay = 100 * (myPort.read() - mid_val) / max_val;
      az = 100 * (myPort.read() - mid_val) / max_val;
      
      //読み込みが終了したことをArduinoに通知
      myPort.write(255);
      
      //読み込んだデータの表示
     // print("X :" + ax);
     // print(" Y :" + ay);
     // println(" Z :" + az);
    }
}


