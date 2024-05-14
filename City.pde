class City {
    float citySizeWidth = width * 0.05;    // scale size of city to 5% of window size
    float citySizeHeight = height * 0.05;
    float cityPositionX;
    float cityPositionY = height * 0.85; // bottom of city positioned to 90% height of window
    color cityColour;
  
    City(float cityPositionX){
        this.cityPositionX = cityPositionX * width; // uses citySpacing[] array for x coordinate
        this.cityColour = color(255, 255, 255);
    }
 
    boolean cityHitDetection(float missleX, float missleY) { // Check if bomb has hit city
        return (missleX > cityPositionX && missleX < (cityPositionX + citySizeWidth) && missleY > cityPositionY);
    }
    
    void citySafe(){ // Unhit city shape
        fill(cityColour); 
        rect(cityPositionX, cityPositionY, citySizeWidth, citySizeHeight);
    }
    
    void cityHit(){ // Destroyed city shape
        fill(cityColour);
        rect(cityPositionX, cityPositionY + height * 0.025, citySizeWidth, citySizeHeight - height * 0.025);
    }
}
