class Ball extends GameObject {
  
  Ball() {
    // Set default size & position
    setSize( BALL_RADIUS, BALL_RADIUS );
    setPos(width/2, height-height/4);
    
    // determine random starting speed
    float x_speed = random(-BALL_MAX_X_SPEED/5, BALL_MAX_X_SPEED/5);
    float y_speed = BALL_MAX_Y_SPEED / 8;
    setSpeed(x_speed, y_speed);
  }

  void update() {
    // Calculate and execute movement:
    // distance = base speed * time since last update
    int deltaT = getUpdateDeltaT();
    PVector movement = speed.copy().mult(deltaT);
    pos = pos.add(movement);
    
    // lower points for time passed
    points -= deltaT;
    
    // Check if we hit any bricks or the paddle
    for (GameObject other : game.getObjects()) {
      if (this != other) {
        // Check every GameObject of the game, except ourself
        
        // Get other object's position & speed
        PVector otherPos = other.getPos();
        PVector otherSize = other.getSize();
        
        // Check if circle of ball overlaps rectangle of brick/paddle
        if( pos.x + size.x > otherPos.x && pos.x - size.x < otherPos.x + otherSize.x) {
          if( pos.y + size.y > otherPos.y && pos.y - size.y < otherPos.y + otherSize.y) {
            // Notify the other object that it just got hit
            // with strength 1 (= 1hp lost)
            other.takeHit(1);
            points += 3000;
            
            // Revert our move - we shouldn't go into the other object
            pos = pos.sub(movement);
            
            // Determine Hit Direction
            if(pos.x < otherPos.x) { speed.x = -speed.x;} // Hit from left 
            if(pos.x > otherPos.x + otherSize.x) { speed.x = -speed.x; } // Hit from right
            if(pos.y < otherPos.y) { speed.y = -speed.y; } // Hit from above
            if(pos.y > otherPos.y + otherSize.y) { speed.y = -speed.y; } // Hit from below
            
            // Special behaviour when we hit the player paddle
            if(other.getClass() == Paddle.class) {
              // Change our horizontal speed relative to where we hit the paddle
              // hit left -> negative x speed
              // hit right -> positive x speed
              // hit center -> no x speed
              speed.x = map(pos.x, otherPos.x, otherPos.x + otherSize.x, -BALL_MAX_X_SPEED, BALL_MAX_X_SPEED);
            }
          }
        }
      }
    }
    // end object collision check
    
    // check if we hit right or left boundary
    if(pos.x >= width-size.x ||pos.x <= size.x) {
      speed.x = -speed.x; 
      pos.x = constrain(pos.x, size.x+1, width-size.x-1);
    }
    
    // check if we hit top boundary 
    if(pos.y <= size.y) {
      speed.y = -speed.y; pos.y = size.y+1;
    }
    
    // check if we fell through bottom boundary
    // set hp=0 to show game that this ball needs to get removed
    else if(pos.y >= height-size.y) hp = 0;
  }


  void draw() {
    fill(col_fill);
    stroke(col_stroke);
    ellipse(pos.x, pos.y, size.x, size.y);
  }
}