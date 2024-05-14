class Missile {

    PVector location;
    ArrayList<PVector> path;
    PVector velocity;
    PVector acceleration;
    float drawSpeed; // in milliseconds, the interval between updates
    boolean isActive;
    int lastUpdateTime; // Last update time in milliseconds

    Missile(PVector target) {
        this.location = new PVector(random(width), 0);
        this.path = new ArrayList<PVector>();
        this.velocity = new PVector(0, 0);
        this.acceleration = new PVector(0, 0);
        this.drawSpeed = 50;
        this.isActive = true;
        this.lastUpdateTime = millis();

        // Compute initial velocity
        PVector initialVelocity = PVector.sub(target, this.location);
        initialVelocity.normalize();
        initialVelocity.mult(5);
        this.velocity = initialVelocity;
    }

    void setDrawSpeed(float speed) {
        this.drawSpeed = speed;
    }

    void update() {
        if (!isActive) return;

        int currentTime = millis();
        if (currentTime - lastUpdateTime >= drawSpeed) { // update position based on time passed
            lastUpdateTime = currentTime; // reset last update time
            
            path.add(new PVector(location.x, location.y)); // update previous location
            velocity.add(acceleration); // add acceleration
            location.add(velocity); // move to new location

            for (int i = 0; i < cities.length; i++) {
                if (cities[i].cityHitDetection(location.x, location.y)) {
                    isActive = false;
                    hitMarker[i] = true;
                    path.clear();
                    break;
                }
            }
        }
    }

  void display() {
      if (!isActive) return;
  
      color flashColour = (frameCount / 10 % 2 == 0) ? missileColour : color(255, 255, 255);  
      stroke(flashColour);
      strokeWeight(2);
      noFill();
  
      for (int i = 1; i < path.size(); i++) {
          line(path.get(i-1).x, path.get(i-1).y, path.get(i).x, path.get(i).y);
      }   
 
      noStroke();
}
}
