public class Trail {
  
  int outerTrailLength, coreTrailLength;
  float outerTrailWeight, coreTrailWeight;
  int outerTrailColor;
  int[] trailX, trailY;
  
  public Trail(){
    
      outerTrailLength = 150;
      coreTrailLength = 70;
      outerTrailWeight = width/30;
      coreTrailWeight = height/60;
      outerTrailColor = 0;
      //-----------------------------------------------------------------------------------------------------
      
      trailX = new int[outerTrailLength];
      trailY = new int[outerTrailLength];
    
  }
  
  
  public void disp(int x, int y, int r, int g, int b){
    
    
    
    //UPDATE TRAIL VERTEXES
      for (int i = 0; i < outerTrailLength; i++) {
        if (i == outerTrailLength-1) {
          trailX[0] = x;              //INSERT X-COORDINATES OF SOMBRERO HERE
          trailY[0] = y;              //INSERT Y-COORDINATES OF SOMBRERO HERE
        } else {
          trailX[outerTrailLength-1-i] = trailX[outerTrailLength-2-i];
          trailY[outerTrailLength-1-i] = trailY[outerTrailLength-2-i];
        }
      }
      
      //DRAW OUTER TRAIL
      stroke(r, g, b);    //G.p.stroke(outerTrailColor);         
      for (int i = 0; i < outerTrailLength - 1; i++) {
        line(trailX[i], trailY[i], trailX[i + 1], trailY[i + 1]);
        strokeWeight(outerTrailWeight - (outerTrailWeight / outerTrailLength) * (i + 1));
      }

      //DRAW CORE TRAIL
      stroke(255);
      for (int i = 0; i < coreTrailLength; i++) {
        line(trailX[i], trailY[i], trailX[i + 1], trailY[i + 1]);
        strokeWeight(coreTrailWeight - (coreTrailWeight / coreTrailLength) * (i + 1));
      }
    
  }
  
  
}