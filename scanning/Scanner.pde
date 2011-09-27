class Scanner {
  ArrayList buttons;
  float scanSpeed;

  boolean scanning = false;
  float lastTime;

  int currentButtonPosition;

  Scanner() {
    scanSpeed = 1.5;  
    buttons = new ArrayList();
  }

  //add button to arraylist
  void addButton(Button tButton) {
    buttons.add(tButton);
  }

  void showButtons() {
    if (scanning) {
      if (millis() - lastTime > (scanSpeed*1000)) {

        //turn off highlight
        Button currButton = (Button)buttons.get(currentButtonPosition);
        currButton.highlight(false);

        //loop button arraylist,         
        if (currentButtonPosition == buttons.size()-1) {
          currentButtonPosition = 0; //return to 0 front of array list if at end
        } 
        else {
          currentButtonPosition++; //else increment
        }

        //highlight button
        Button newButton = (Button)buttons.get(currentButtonPosition);
        newButton.highlight(true);

        //reset counter
        lastTime = millis();
      }
    }

    for (int i=0; i<=buttons.size()-1; i++) {
      Button tmpButton = (Button)buttons.get(i);
      tmpButton.display();
    }
  }

  void startScanning() {
    scanning = true;
    currentButtonPosition = 0; //get first button
    //highlight button
    Button newButton = (Button)buttons.get(currentButtonPosition);
    newButton.highlight(true);

    lastTime = 0;
  }

  void stopScanning() {
    scanning = false;
  }

  void setSpeed(float _speed) {
    scanSpeed = _speed;
  }

  void increaseSpeed() {
    scanSpeed += .3;
    println("speed: " + scanSpeed);
  }

  void decreaseSpeed() {
    if (scanSpeed > .4) {
      scanSpeed -= .3;
      println("speed: " + scanSpeed);
    }
  }

  Button getCurrentButton() {
    Button currButton = (Button)buttons.get(currentButtonPosition);
    return currButton;
  }
}

