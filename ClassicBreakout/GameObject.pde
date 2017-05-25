abstract class GameObject {
  // Parent class for all GameObjects
  
  // Speed of an object
  // unit: pixels/millisecond
  PVector speed;
  
  // Position of an object
  PVector pos;
  
  // Size of an object
  PVector size;
  
  // Colors of an Object:
  // fill & stroke color
  color col_fill;
  color col_stroke;
  
  // Time the object was last updated
  // (millis since program started)
  int lastUpdate = millis();
  
  // Hitpoints of an object
  int hp = 2147483647;
  
  
  GameObject() {
    // Set default values for all fields
    speed = new PVector(0, 0);
    pos = new PVector(0, 0);
    size = new PVector(0, 0);
    col_fill = #ffffff;
    col_stroke = #000000;
  }
  
  
  /* Getters & Setters */
  PVector getPos() { return pos; }
  PVector getSpeed() { return speed; }
  PVector getSize() { return size; }
  color getFillColor() { return col_fill; }
  color getStrokeColor() { return col_stroke; }
  int getUpdateDeltaT() { int deltaT = millis() - lastUpdate; lastUpdate = millis(); return deltaT; }
  int getHP() { return hp; }
  
  GameObject setPos(float x, float y) {
    this.pos = new PVector(x, y);
    return this;
  }
  
  GameObject setSpeed(float x, float y) {
    this.speed = new PVector(x, y);
    return this;
  }
  
  GameObject setSize(float x, float y) {
    this.size = new PVector(x, y);
    return this;
  }
  
  GameObject setColor(color fill, color stroke) {
    this.col_fill = fill;
    this.col_stroke = stroke;
    return this;
  }
  // End of getters / setters
  
  
  void simpleMove() {
    // Move the object without looking for collisions
    // distance = base speed * time since last update
    pos.add(speed.mult(getUpdateDeltaT()));
    
    // constrain position within playarea
    pos.x = constrain(pos.x, 0, width-size.x);
    pos.y = constrain(pos.y, 0, height-size.y);
  }
  
  void takeHit(int strength) {
    // reduce hp
    hp -= strength;
  }
  
  abstract void update();
  abstract void draw();
}