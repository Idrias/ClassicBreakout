class Brick extends GameObject {
  Brick() {
    setSize(BRICK_SIZE_X, BRICK_SIZE_Y);
    setPos(100, 100);
    hp = 1;
  }
  
  void update() {}
  
  void draw() {
    fill(col_fill);
    stroke(col_stroke);
    rect(pos.x, pos.y, size.x, size.y);
  }
}