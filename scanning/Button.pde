class Button {
  String name;
  int x, y;
  int w, h; //width, height
  PImage bgImage;
  boolean highlighted;

  Button(String _name, int _x, int _y, int _w, int _h, PImage _image) {
    name = _name;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    bgImage = _image;
  }


  void display() {

    if (highlighted) {
      
      if (scanner.scanning) {
        fill(104, 255, 0);
      } else {
        fill(255, 50, 0);
        
      }
      rectMode(CENTER);
      rect(x, y, 150, 150);
    }

    imageMode(CENTER);
    image(bgImage, x, y, w, h);
  }

  void highlight(boolean value) {
    highlighted = value; //true or false
  }
}

