class Game {
  ArrayList<GameObject> gameObjects;

  Game() {
    gameObjects = new ArrayList<GameObject>();
  }

  void play() {
    
    for (int i=0; i<gameObjects.size(); i++) {
      GameObject go = gameObjects.get(i);

      if (go.getHP() <= 0) {
        gameObjects.remove(i);
        i--;
      } else {
        go.update();
        go.draw();
      }
    }
    
  }


  void addObject(GameObject go) {
    gameObjects.add(go);
  }

  ArrayList<GameObject> getObjects() {
    return gameObjects;
  }
}