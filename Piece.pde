class Piece {
  int type;
  int col;
  PImage img = null;
  Piece(int t, int c) {
    type = t;
    col = c;
    if (t != -1 && c != -1) {
      img = imgs[c][t];
    }
  }

  void render(int x, int y) {
    if (img != null) {
      image(img, x * tileSize + borderSize, y * tileSize + borderSize, tileSize, tileSize);
    }
  }
}
