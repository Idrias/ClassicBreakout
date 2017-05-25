class Ball extends GameObject {
  
  Ball() {
    // Set default size & position
    setSize( BALL_RADIUS, BALL_RADIUS );
    setPos(width/2, height-height/4);
    
    // determine random starting speed
    float x_speed = random(-BALL_MAX_X_SPEED/5, BALL_MAX_X_SPEED/5);
    float y_speed = BALL_MAX_Y_SPEED / 8;
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
            if(pos.x < otherPos.x) { speed.x = -speed.x;} // Hit from left 
            if(pos.x > otherPos.x + otherSize.x) { speed.x = -speed.x; } // Hit from right
            if(pos.y < otherPos.y) { speed.y = -speed.y; } // Hit from top
            if(pos.y > otherPos.y + otherSize.y) { speed.y = -speed.y; } // Hit from below
            
            if(other.getClass() == Paddle.class) {
              speed.x = map(pos.x, otherPos.x, otherPos.x + otherSize.x, -BALL_MAX_X_SPEED, BALL_MAX_X_SPEED);
              println(speed.x);
            }
          }
        }
      }
    }
    
    if(pos.x >= width-size.x ||pos.x <= size.x) {speed.x = -speed.x; pos.x = constrain(pos.x, size.x+1, width-size.x-1);}
    if(pos.y <= size.y) {speed.y = -speed.y; pos.y = size.y+1;}
    else if(pos.y >= height-size.y) hp = 0;
    
    pos.x = constrain(pos.x, 0, width-size.x);
    pos.y = constrain(pos.y, 0, height-size.y);
  }


  void draw() {
    fill(col_fill);
    stroke(col_stroke);
    ellipse(pos.x, pos.y, size.x, size.y);
  }
}