class Battery {
  
  float ammoX, ammoY; // Position x and y for rectangle
  
  Battery(float _blockX, float _blockY) {
    this.ammoX = width * _blockX;
    this.ammoY = height * _blockY;
  }

  void drawAmmoStack() {
    fill(10);
    stroke(1);
    rect(ammoX, ammoY, width * 0.02, height * 0.01);
  }

  void drawAmmoReserve() {
    fill(10);
    rect(ammoX, ammoY, width * 0.05, height * 0.05);
  }

}
