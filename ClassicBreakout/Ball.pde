class Ball extends GameObject {
  
  Trail trail = new Trail();
  
  Ball() {
    setSize( BALL_RADIUS, BALL_RADIUS );
    setPos(width/2, height-height/4);
    
    float x_speed = random(-BALL_MAX_X_SPEED/5, BALL_MAX_X_SPEED/5);
    float y_speed = BALL_MAX_Y_SPEED / 10;
    speed = new PVector(x_speed, y_speed);
  }

  void update() {
    PVector movement = speed.copy().mult(getUpdateDeltaT());
    pos = pos.add(movement);
    
    for (GameObject other : game.getObjects()) {
      if (this != other) {
        PVector otherPos = other.getPos();
        PVector otherSize = other.getSize();

        if( pos.x + size.x > otherPos.x && pos.x - size.x < otherPos.x + otherSize.x) {
          if( pos.y + size.y > otherPos.y && pos.y - size.y < otherPos.y + otherSize.y) {
            
            // HIT!
            other.takeHit();
            
            
            
            
            pos = pos.sub(movement);
            // Determine Hit Direction
            if(pos.x < otherPos.x) { speed.x = -speed.x; }
            if(pos.x > otherPos.x + otherSize.x) { speed.x = -speed.x;}
            if(pos.y < otherPos.y) { speed.y = -speed.y; }
            if(pos.y > otherPos.y + otherSize.y) { speed.y = -speed.y; }
            
            if(other.getClass() == Paddle.class) {
              speed.x = map(pos.x, otherPos.x, otherPos.x + otherSize.x, -BALL_MAX_X_SPEED, BALL_MAX_X_SPEED);
              println(speed.x);
              bounce();
            } else {
              burstPlay.rewind(); 
              burstPlay.play();
            }
          }
        }
      }
    }
    
    if(pos.x > width-size.x ||pos.x < size.x) {
      speed.x = -speed.x;
      bounce();
    }
    if(pos.y < size.y) {
      speed.y = -speed.y;
      bounce();
    }  
    else if(pos.y > height-size.y) hp = 0;
    pos.x = constrain(pos.x, 0, width-size.x);
    pos.y = constrain(pos.y, 0, height-size.y);
  }
  
  void bounce(){
     bouncePlay.rewind(); 
     bouncePlay.play();
  }

  void draw() {
    fill(col_fill);
    stroke(col_stroke);
    trail.disp((int)pos.x, (int)pos.y, 30, 255, 30);
    //ellipse(pos.x, pos.y, size.x, size.y);
  }
}