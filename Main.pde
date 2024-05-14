/**
 * Assignment 3 - COSC101 T1 2024
 * Missile Command
 *
 * Authors:
 * - Jordan Rothwell
 * - Kline Hodgson
 * - Harrison Grant
 */

City[] cities = new City[6]; // cities to be defended
ArrayList<Missile> missiles; // missiles currently on screen
float citySpacing[] = {0.10, 0.20, 0.30, 0.60, 0.70, 0.80}; // array to set spacing of cities
boolean hitMarker[]; // array to store if city is hit / safe
PVector target; // target coordinates for a given missile
color missileColour; // variable to store a uniform missile colour

Battery[] battery = new Battery[12]; //10 ammo + 2 reserve ammo
float[] batterySpacingX = {0.05, 0.15, 0.49, 0.47, 0.51, 0.45, 0.49, 0.53, 0.43, 0.47, 0.51, 0.55};
float[] batterySpacingY = {0.93, 0.93, 0.9, 0.91, 0.91, 0.92, 0.92, 0.92, 0.93, 0.93, 0.93, 0.93};
int startingAmmo = 30;
int currentAmmo = startingAmmo;

void setup() {
  size(1000, 500);

  hitMarker = new boolean[6];
  missiles = new ArrayList<Missile>();
  
  missileColour = color(random(255), random(255), random(255)); // Generate a random colour for all missiles

  for (int i = 0; i < cities.length; i++) {
      cities[i] = new City(citySpacing[i]);
      hitMarker[i] = false; // City not hit initially
  }
    
  for (int i = 0 ; i < battery.length; i++) {
    battery[i] = new Battery(batterySpacingX[i], batterySpacingY[i]);
  }
}

void draw() {
    background(125, 125, 125);
    
    // Update and display each missile
    for (Missile m : missiles) {
        m.update();
        m.display();
    }
    
    // Update display of cities based on hitMarker state
    for (int i = 0; i < cities.length; i++) {
        if (hitMarker[i]) { 
            cities[i].cityHit(); // Draw hit city
        } else { 
            cities[i].citySafe(); // Draw safe city
        }
    }
    if (currentAmmo > 20){
  
    battery[0].drawAmmoReserve(); // Draw ammo box 1
    battery[1].drawAmmoReserve(); // Draw ammo box 2
    int remainingAmmo = currentAmmo - 20; // Ammo that doesn't fit in ammo box
    for (int i = 2; i <= remainingAmmo+1; i++) { // Start at [2], as [0] and [1] are ammo box objects
      battery[i].drawAmmoStack(); // Draw indivisual bullets
    }
    } else if (currentAmmo > 10){
      
        battery[0].drawAmmoReserve();
        int remainingAmmo = currentAmmo - 10; // Ammo that doesn't fit in ammo box
        for (int i = 2; i <= remainingAmmo+1; i++) {
          battery[i].drawAmmoStack(); // Draw indivisual bullets
        }
    } else {
      
      for (int i = 2; i <= currentAmmo+1; i++) {
          battery[i].drawAmmoStack(); // Draw indivisual bullets
        }
    }
}

void mousePressed() {
    PVector mouseTarget = new PVector(mouseX, mouseY);
    missiles.add(new Missile(mouseTarget));
    currentAmmo--;
}
