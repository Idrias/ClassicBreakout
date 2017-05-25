//--------------------------------------------------------
// Global Variables

Game game;  // Object which simulates the game/playarea

// Keyboard Input
final static char KEY_MOVE_LEFT = 'a';  
final static char KEY_MOVE_RIGHT = 'd';

// Array to hold a boolean for every ASCII/ANSI code:
//true -> key is pressed
//false -> key isn't pressed 
boolean[] keys; 

// Game Vars
final static float BRICK_SIZE_X = 60;  // Width of a brick
final static float BRICK_SIZE_Y = 30;  // Height of a brick

final static float PADDLE_SPEED = 0.4;  // Speed of player paddle
final static float PADDLE_LENGTH = 80;  // Width of player paddle

final static float BALL_MAX_X_SPEED = 0.5;  // Maximal absolute horizontal speed of ball
final static float BALL_MAX_Y_SPEED = 1.6;  // Maximal absolute vertical speed of ball
final static float BALL_RADIUS = 5;  // Radius of ball
//--------------------------------------------------------


void setup_vars() {
  // Processing settings
  ellipseMode(RADIUS);
  frameRate(144);
  
  game = new Game(); 
  keys = new boolean[256];
  for (int i=0; i<keys.length; i++) keys[i] = false;
  
  /* Default Level */
  game.addObject( new Ball() );
  game.addObject( new Paddle() );
  
  // Fill the playarea with bricks
  for(int x=60; x <= width -60 -BRICK_SIZE_X; x+=BRICK_SIZE_X) {
    for(int y=100; y <= height/2; y+=BRICK_SIZE_Y) {
      game.addObject( new Brick().setPos(x, y) );
    }
  }
  //////////////////////
  
}