/*
  A game inspired by Atari's Breakout (1976)
  Rouven Grenz & Adrian Lüneburg, 2017
*/


void setup() {
  size(600, 700);
  setup_vars();
  //-> global_vars.pde
}

void draw() {
  background(0);
  game.play();
}

void keyPressed() {
  if (key < 256) keys[key] = true;
}

void keyReleased() {
  if (key < 256) keys[key] = false;
}