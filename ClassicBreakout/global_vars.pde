//--------------------------------------------------------
// Global Variables
Game game;

// Keyboard Input
final static char KEY_MOVE_LEFT = 'a';
final static char KEY_MOVE_RIGHT = 'd';
boolean[] keys;

final static float BRICK_SIZE_X = 60;
final static float BRICK_SIZE_Y = 30;

final static float PADDLE_SPEED = 0.3;
final static float PADDLE_LENGTH = 80;

final static float BALL_MAX_X_SPEED = 0.6;
final static float BALL_MAX_Y_SPEED = 1.6;
final static float BALL_RADIUS = 5;
//--------------------------------------------------------


void setup_vars() {
  ellipseMode(RADIUS);
  frameRate(144);
  game = new Game(); 
  keys = new boolean[256];
  for (int i=0; i<keys.length; i++) keys[i] = false;
  
   
  game.addObject( new Ball() );
  game.addObject( new Paddle() );
  for(int x=60; x <= width -60 -BRICK_SIZE_X; x+=BRICK_SIZE_X) {
    for(int y=100; y <= height/2; y+=BRICK_SIZE_Y) {
      game.addObject( new Brick().setPos(x, y) );
    }
  }
}