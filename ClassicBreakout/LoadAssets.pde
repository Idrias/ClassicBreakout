Minim bounce;
Minim burst;
Minim bgm;
AudioPlayer bouncePlay;
AudioPlayer burstPlay;
AudioPlayer bgmPlay;

PImage brick;
PImage[] brickSprites = new PImage[9];

void loadSound(){
  bounce = new Minim(this);
  burst = new Minim(this);
  bgm = new Minim(this);
  
  bouncePlay = bounce.loadFile("SFX/Bounce.mp3");
  burstPlay = burst.loadFile("SFX/BrickBurst.mp3");
  bgmPlay = bgm.loadFile("Music/bgm.mp3");
}

void loadImages(){
  brick = loadImage("GFX/Brick.png");
  int W = brick.width/3;
  int H = brick.height/3;
  for (int j=0; j<brickSprites.length; j++) {
    int x = j%3*W;
    int y = j/3*H;
    brickSprites[j] = brick.get(x, y, W, H);
  }
}