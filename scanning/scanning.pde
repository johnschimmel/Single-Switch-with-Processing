Scanner scanner;
ArrayList mainButtons;
int numberOfButtons = 3;

PImage imgApple, imgLime, imgGrapes;

String displayWord = "";
PFont font;

void setup() {

  size(800, 500);

  imgApple = loadImage("apple.png");
  imgLime = loadImage("lime.jpg");
  imgGrapes = loadImage("grapes.png");

  //create buttons
  Button appleButton = new Button("apple", (width/3)-50, height-100, 100, 100, imgApple);
  Button limeButton = new Button("lime", (width/2), height-100, 100, 100, imgLime);
  Button grapesButton = new Button("grapes", width-(width/3)+50, height-100, 100, 100, imgGrapes);

  scanner = new Scanner(); //initialize the scanner
  scanner.setSpeed(2); //2 second delay for scanning

  //put buttons into scanner
  scanner.addButton(appleButton); //add buttons
  scanner.addButton(limeButton); //add buttons
  scanner.addButton(grapesButton); //add buttons

  scanner.startScanning();
  
  font = loadFont("Verdana-Bold-96.vlw");
  
}

void draw() {

  background(100, 150, 250);

  scanner.showButtons();

  if (displayWord != "") {
    
    fill(255);
    
    textFont(font, 96); 
    text(displayWord, 200, 150);
  }
}


void mousePressed() {
  if (scanner.scanning) {
    scanner.stopScanning();

    Button currButton = (Button)scanner.getCurrentButton();

    println("Selected button = " + currButton.name);

    if (currButton.name == "apple") { 
      displayWord = "APPLE";
    } 
    else if (currButton.name == "lime") {
      displayWord = "LIME";
    } 
    else if (currButton.name == "grapes") {
      displayWord = "GRAPES";
    }
  } 
  else {
    scanner.startScanning();
    displayWord = "";
  }
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      scanner.increaseSpeed();
    } 
    else if (keyCode == DOWN) {
      scanner.decreaseSpeed();
    }
  }
}

