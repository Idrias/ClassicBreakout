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
}

void keyPressed() {
  if (key < 256) keys[key] = true;
}

void keyReleased() {
  if (key < 256) keys[key] = false;
}