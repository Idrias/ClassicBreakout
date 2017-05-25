class Game {
  // This class simulates the playarea

  // All objects of the game
  ArrayList<GameObject> gameObjects;

  Game() {
    gameObjects = new ArrayList<GameObject>();
  }


  void play() {    
    // Simulate all GameObjects
    for (int i=0; i<gameObjects.size(); i++) {
      GameObject go = gameObjects.get(i);

      // GameObject has no hp left 
      // -> remove from game
      if (go.getHP() <= 0) {
        gameObjects.remove(i);
        i--;
      } else {
        // Update and draw the GameObject
        go.update();
        go.draw();
      }
    }
    
    fill(255);
    text("Points: " + points, 20, 20);
  }


  void addObject(GameObject go) {
    // add another GameObject
    gameObjects.add(go);
  }

  ArrayList<GameObject> getObjects() {
    // return arraylist of all gameobjects
    return gameObjects;
  }
}