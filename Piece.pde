class Piece {
  int type;
  int col;
  int x;
  int y;
  boolean dragging = false;
  PImage img = null;
  Piece(int t, int c, int _x, int _y) {
    type = t;
    col = c;
    x = _x * tileSize + borderSize;
    y = _y * tileSize + borderSize;
    
    if (t != -1 && c != -1) {
      img = imgs[c][t];
    }
  }

  void renderStill() {
    if (img != null) {
      image(img, x, y, tileSize, tileSize);
    }
  }
  
  void dragStart() {
    if (mouseX > x && mouseX < x + tileSize && mouseY > y && mouseY < y + tileSize) {
      dragging = true;
    }
  }
  
  void dragStop() {
    dragging = false;
  }
  
  void mouseDragged() {
    if (dragging) {
      x = mouseX - tileSize / 2;
      y = mouseY - tileSize / 2;
    }
  }
}
