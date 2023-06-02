color white;
color black;
int tileSize = 80;
int borderSize = 10;
PImage[][] imgs = new PImage[2][6];

ArrayList<Piece> pieces = new ArrayList<Piece>();

void loadStartPosition() {
  pieces = new ArrayList<Piece>();
  
  for (int i = 0; i < 2; i++) {
    pieces.add(new Piece(1, i, 0, 7 * i));
    pieces.add(new Piece(2, i, 1, 7 * i));
    pieces.add(new Piece(3, i, 2, 7 * i));
    pieces.add(new Piece(5, i, 3, 7 * i));
    pieces.add(new Piece(4, i, 4, 7 * i));
    pieces.add(new Piece(3, i, 5, 7 * i));
    pieces.add(new Piece(2, i, 6, 7 * i));
    pieces.add(new Piece(1, i, 7, 7 * i));
    
    for (int j = 0; j < 8; j++) {
      pieces.add(new Piece(0, i, j, 5 * i + 1));
    }
  }
}

void mousePressed() {
  for (Piece p : pieces) {
    p.dragStart();
  }
}

void mouseReleased() {
  for (Piece p : pieces) {
    p.dragStop();
  }
}

void settings() {
  size(tileSize * 8 + borderSize * 2, tileSize * 8 + borderSize * 2);
}

void setup() {
  white = color(238, 238, 210);
  black = color(118, 150, 86);
  noStroke();

  imgs[0][0] = loadImage("img/bPawn.png");
  imgs[0][1] = loadImage("img/bRook.png");
  imgs[0][2] = loadImage("img/bKnight.png");
  imgs[0][3] = loadImage("img/bBishop.png");
  imgs[0][4] = loadImage("img/bKing.png");
  imgs[0][5] = loadImage("img/bQueen.png");

  imgs[1][0] = loadImage("img/wPawn.png");
  imgs[1][1] = loadImage("img/wRook.png");
  imgs[1][2] = loadImage("img/wKnight.png");
  imgs[1][3] = loadImage("img/wBishop.png");
  imgs[1][4] = loadImage("img/wKing.png");
  imgs[1][5] = loadImage("img/wQueen.png");

  loadStartPosition();
}

void draw() {
  background(0);
  for (int y = 0; y < 8; y++) {
    for (int x = 0; x < 8; x++) {
      color current;
      if ((x + y) % 2 == 0) {
        current = white;
      } else {
        current = black;
      }
      fill(current);
      rect(tileSize * x + borderSize, tileSize * y + borderSize, tileSize, tileSize);
    }
  }
  
  for (Piece p : pieces) {
    p.mouseDragged();
    p.renderStill();
  }
}
