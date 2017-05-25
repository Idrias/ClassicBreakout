class Brick extends GameObject {
  Brick() {
    setSize(BRICK_SIZE_X, BRICK_SIZE_Y);
    setPos(100, 100);
    hp = 1;
  }

  void update() {
  }

  void draw() {
    fill(col_fill);
    stroke(col_stroke);

    //rect(pos.x, pos.y, size.x, size.y);


  
    beginShape();
    texture(brickSprites[0]);
    vertex(pos.x, pos.y, 0, 0);
    vertex(pos.x + size.x, pos.y, 1, 0);
    vertex(pos.x + size.x, pos.y + size.y, 1, 1);
    vertex(pos.x, pos.y + size.y, 0, 1);
    vertex(pos.x, pos.y, 0, 0);
    endShape();
  }
}