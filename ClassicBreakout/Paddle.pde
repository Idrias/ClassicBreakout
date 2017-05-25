class Paddle extends GameObject{
  // Player paddle
  
  Paddle() {
    // set default values
    setSize(PADDLE_LENGTH, 10);
    setPos(width/2, height-30);
  }
  
  void update() {
    // simulate object
    
    // set speed according to player input
    int speedX = 0;
    if(keys[KEY_MOVE_LEFT]) speedX--;
    if(keys[KEY_MOVE_RIGHT]) speedX++;
    setSpeed(speedX*PADDLE_SPEED, 0);
    
    // move without looking for collisions
    simpleMove();
  }
  
  void draw() {
    fill(col_fill);
    stroke(col_stroke);
    rect(pos.x, pos.y, size.x, size.y);
  }
}