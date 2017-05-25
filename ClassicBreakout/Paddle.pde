class Paddle extends GameObject{
  Paddle() {
    setSize(PADDLE_LENGTH, 10);
    setPos(width/2, height-30);
  }
  
  void update() {
    int speedX = 0;
    if(keys[KEY_MOVE_LEFT]) speedX--;
    if(keys[KEY_MOVE_RIGHT]) speedX++;
    setSpeed(speedX*PADDLE_SPEED, 0);
    simpleMove();
  }
  
  void draw() {
    fill(col_fill);
    stroke(col_stroke);
    rect(pos.x, pos.y, size.x, size.y);
  }

}