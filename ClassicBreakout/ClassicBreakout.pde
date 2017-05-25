/*
  A game inspired by Atari's Breakout (1976)
 Rouven Grenz, 2017
 */

import ddf.minim.*;

void setup() {
  size(600, 700, P2D);
  setup_vars();
  loadSound();
  loadImages();

  textureMode(NORMAL);
  bgmPlay.loop(0);
}

void draw() {
  background(0);
  game.play();

  if (destruct) {
  
    beginShape();
    texture(brickSprites[c]);
    vertex(x, y, 0, 0);
    vertex(x + BRICK_SIZE_X, y, 1, 0);
    vertex(x + BRICK_SIZE_X, y + BRICK_SIZE_Y, 1, 1);
    vertex(x, y + BRICK_SIZE_Y, 0, 1);
    vertex(x, y, 0, 0);
    endShape();
    if(frameCount%3 == 0)c++;
    if(c >= 8){
      destruct = false;
      c = 0;
    }
  }
}

void keyPressed() {
  if (key < 256) keys[key] = true;
}

void keyReleased() {
  if (key < 256) keys[key] = false;
}