class StrongBrick extends Brick {
  StrongBrick() {
    // Set default size, position & hp
    setSize(BRICK_SIZE_X, BRICK_SIZE_Y);
    setPos(100, 100);
    setColor(#DE6060, #000000);
    hp = 2;
  }

  @Override
    void takeHit(int strength) {
    hp -= strength;
    
    // Change color when first hitpoint is lost
    if (hp == 1) setColor(#ffffff, #000000);
  }
}