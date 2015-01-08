// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html
// Daniel Shiffman <http://www.shiffman.net>

import java.awt.Rectangle;

class Button {
  Rectangle r;  // Button's rectangle
  String txt;   // Button's text
  boolean clicked;  // Did i click on it?
  boolean rollover; // Did i rollover it?

  Button(int x, int y, int w, int h, String s) {
    r = new Rectangle(x ,y , w, h);
    txt = s;
  }

  void display() {
    // Draw rectangle and text based on whether rollover or clicked
    rectMode(CORNER);
    noStroke(); fill(200);
    if (rollover) fill(100);
    if (clicked) fill(100);
    rect(r.x,r.y,r.width,r.height);
    float b = 0.0;
    if (clicked) b = 255;
    else if (rollover) b = 255;
    else b = 255;
    fill(b);
    textAlign(CENTER);
    textFont(fBold, 22);
    text(txt,r.x+r.width/2,r.y+r.height/2+7);

  }
  
  
  // Methods to check rollover, clicked, or released (must be called from appropriate
  // Places in draw, mousePressed, mouseReleased
  boolean rollover(int mx, int my) {
    if (r.contains(mx,my)) rollover = true;
    else rollover = false;
    return rollover;
  }

  boolean clicked(int mx, int my) {
    if (r.contains(mx,my)) clicked = true;
    return clicked;
  }

  void released() {
    clicked = false;
  }

}
