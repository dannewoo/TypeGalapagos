import geomerative.*;
import controlP5.*;
import processing.pdf.*;

ControlP5 controlP5;
RFont font;
ArrayList coords;
Population population;
Button button, button2, 
aB, bB, cB, dB, eB, fB, gB, hB, iB, jB, kB, lB, mB, nB, oB, pB, qB, rB, sB, tB, uB, vB, wB, xB, yB, zB;
String theValue = "z";
PFont f;
PFont fBold;
int popmax = 5;
float mutationRate = 0.05;  // A pretty high mutation rate here, our population is rather small we need to enforce variety
int alphaBtnSize = 42;
int btnKerning = 5;

boolean recording = false;

//----------------SETUP---------------------------------
void setup() {
  size(1278, 800);
  background(255);
  controlP5 = new ControlP5(this);
  noStroke();
  smooth();
  coords = new ArrayList();
  button = new Button(width-160-160, 20, 140, 140, "EVOLVE");
  button2 = new Button(width-160, 20, 140, 140, "RESET");
  aB = new Button(20, height-100, alphaBtnSize, alphaBtnSize, "A");
  bB = new Button(20 + alphaBtnSize + btnKerning, height-100, alphaBtnSize, alphaBtnSize, "B");
  cB = new Button(20 + (alphaBtnSize + btnKerning)*2, height-100, alphaBtnSize, alphaBtnSize, "C");
  dB = new Button(20 + (alphaBtnSize + btnKerning)*3, height-100, alphaBtnSize, alphaBtnSize, "D");
  eB = new Button(20 + (alphaBtnSize + btnKerning)*4, height-100, alphaBtnSize, alphaBtnSize, "E");
  fB = new Button(20 + (alphaBtnSize + btnKerning)*5, height-100, alphaBtnSize, alphaBtnSize, "F");
  gB = new Button(20 + (alphaBtnSize + btnKerning)*6, height-100, alphaBtnSize, alphaBtnSize, "G");
  hB = new Button(20 + (alphaBtnSize + btnKerning)*7, height-100, alphaBtnSize, alphaBtnSize, "H");
  iB = new Button(20 + (alphaBtnSize + btnKerning)*8, height-100, alphaBtnSize, alphaBtnSize, "I");
  jB = new Button(20 + (alphaBtnSize + btnKerning)*9, height-100, alphaBtnSize, alphaBtnSize, "J");
  kB = new Button(20 + (alphaBtnSize + btnKerning)*10, height-100, alphaBtnSize, alphaBtnSize, "K");
  lB = new Button(20 + (alphaBtnSize + btnKerning)*11, height-100, alphaBtnSize, alphaBtnSize, "L");
  mB = new Button(20 + (alphaBtnSize + btnKerning)*12, height-100, alphaBtnSize, alphaBtnSize, "M");
  nB = new Button(20 + (alphaBtnSize + btnKerning)*13, height-100, alphaBtnSize, alphaBtnSize, "N");
  oB = new Button(20 + (alphaBtnSize + btnKerning)*14, height-100, alphaBtnSize, alphaBtnSize, "O");
  pB = new Button(20 + (alphaBtnSize + btnKerning)*15, height-100, alphaBtnSize, alphaBtnSize, "P");
  qB = new Button(20 + (alphaBtnSize + btnKerning)*16, height-100, alphaBtnSize, alphaBtnSize, "Q");
  rB = new Button(20 + (alphaBtnSize + btnKerning)*17, height-100, alphaBtnSize, alphaBtnSize, "R");
  sB = new Button(20 + (alphaBtnSize + btnKerning)*18, height-100, alphaBtnSize, alphaBtnSize, "S");
  tB = new Button(20 + (alphaBtnSize + btnKerning)*19, height-100, alphaBtnSize, alphaBtnSize, "T");
  uB = new Button(20 + (alphaBtnSize + btnKerning)*20, height-100, alphaBtnSize, alphaBtnSize, "U");
  vB = new Button(20 + (alphaBtnSize + btnKerning)*21, height-100, alphaBtnSize, alphaBtnSize, "V");
  wB = new Button(20 + (alphaBtnSize + btnKerning)*22, height-100, alphaBtnSize, alphaBtnSize, "W");
  xB = new Button(20 + (alphaBtnSize + btnKerning)*23, height-100, alphaBtnSize, alphaBtnSize, "X");
  yB = new Button(20 + (alphaBtnSize + btnKerning)*24, height-100, alphaBtnSize, alphaBtnSize, "Y");
  zB = new Button(20 + (alphaBtnSize + btnKerning)*25, height-100, alphaBtnSize, alphaBtnSize, "Z");
  f= loadFont ("HelveticaNeue-48.vlw");
  fBold = loadFont ("HelveticaNeue-Bold-56.vlw");

  RG.init(this); 
  font = new RFont("Georgia.ttf", 300, CENTER);
  RCommand.setSegmentLength(1);//ASSIGN A VALUE OF 10, SO EVERY 10 PIXELS
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup myGroup = font.toGroup(theValue); 
  RPoint[] myPoints = myGroup.getPoints();
  coords = new ArrayList();

  population = new Population(mutationRate, popmax);

  //controlP5.addTextfield("textA", 140, height - 250, 130, 20);
}

//----------------DRAW---------------------------------

void draw() {
  background(255);
  if (recording) {
    beginRecord(PDF, "letters/frame-####.pdf");
  }

  population.display();
  population.rollover(mouseX, mouseY);

  textAlign(LEFT);
  textFont(fBold, 80);
  fill(220);
  text("TYPE GALAPAGOS", 20, 80);
  textFont(f, 12);
  fill(206, 77, 77, 200);
  //text("Press -EVOLVE- to create a new generation", 30, height - 210);
  textFont(f, 35);
  fill(220);
  text("Generation Number: " + population.getGenerations(), 21, 125);

  fill(0);
  // Display the button
  button.display(); button.rollover(mouseX, mouseY);
  button2.display(); button2.rollover(mouseX, mouseY);
  aB.display(); aB.rollover(mouseX, mouseY);
  bB.display(); bB.rollover(mouseX, mouseY);
  cB.display(); cB.rollover(mouseX, mouseY);
  dB.display(); dB.rollover(mouseX, mouseY);
  eB.display(); eB.rollover(mouseX, mouseY);
  fB.display(); fB.rollover(mouseX, mouseY);
  gB.display(); gB.rollover(mouseX, mouseY);
  hB.display(); hB.rollover(mouseX, mouseY);
  iB.display(); iB.rollover(mouseX, mouseY);
  jB.display(); jB.rollover(mouseX, mouseY);
  kB.display(); kB.rollover(mouseX, mouseY);
  lB.display(); lB.rollover(mouseX, mouseY);
  mB.display(); mB.rollover(mouseX, mouseY);
  nB.display(); nB.rollover(mouseX, mouseY);
  oB.display(); oB.rollover(mouseX, mouseY);
  pB.display(); pB.rollover(mouseX, mouseY);
  qB.display(); qB.rollover(mouseX, mouseY);
  rB.display(); rB.rollover(mouseX, mouseY);
  sB.display(); sB.rollover(mouseX, mouseY);
  tB.display(); tB.rollover(mouseX, mouseY);
  uB.display(); uB.rollover(mouseX, mouseY);
  vB.display(); vB.rollover(mouseX, mouseY);
  wB.display(); wB.rollover(mouseX, mouseY);
  xB.display(); xB.rollover(mouseX, mouseY);
  yB.display(); yB.rollover(mouseX, mouseY);
  zB.display(); zB.rollover(mouseX, mouseY);
  if (recording) {
    endRecord();
    recording = false;
  }
  println(frameRate);
}

//////////////////////////////////////////////

// If the button is clicked, evolve next generation
void mousePressed() {
  if (button.clicked(mouseX, mouseY)) {
    population.selection();
    population.reproduction();
  }
  if (button2.clicked(mouseX, mouseY)) {
    population = new Population(mutationRate, popmax);
  }
  if (aB.clicked(mouseX, mouseY)) {
    theValue = "A";
    population = new Population(mutationRate, popmax);
  }
  if (bB.clicked(mouseX, mouseY)) {
    theValue = "B";
    population = new Population(mutationRate, popmax);
  }
  if (cB.clicked(mouseX, mouseY)) {
    theValue = "C";
    population = new Population(mutationRate, popmax);
  }
  if (dB.clicked(mouseX, mouseY)) {
    theValue = "D";
    population = new Population(mutationRate, popmax);
  }
  if (eB.clicked(mouseX, mouseY)) {
    theValue = "E";
    population = new Population(mutationRate, popmax);
  }
  if (fB.clicked(mouseX, mouseY)) {
    theValue = "F";
    population = new Population(mutationRate, popmax);
  }
  if (gB.clicked(mouseX, mouseY)) {
    theValue = "G";
    population = new Population(mutationRate, popmax);
  }
  if (hB.clicked(mouseX, mouseY)) {
    theValue = "H";
    population = new Population(mutationRate, popmax);
  }
  if (iB.clicked(mouseX, mouseY)) {
    theValue = "I";
    population = new Population(mutationRate, popmax);
  }
  if (jB.clicked(mouseX, mouseY)) {
    theValue = "J";
    population = new Population(mutationRate, popmax);
  }
  if (kB.clicked(mouseX, mouseY)) {
    theValue = "K";
    population = new Population(mutationRate, popmax);
  }
  if (lB.clicked(mouseX, mouseY)) {
    theValue = "L";
    population = new Population(mutationRate, popmax);
  }
  if (mB.clicked(mouseX, mouseY)) {
    theValue = "M";
    population = new Population(mutationRate, popmax);
  }
  if (nB.clicked(mouseX, mouseY)) {
    theValue = "N";
    population = new Population(mutationRate, popmax);
  }
  if (oB.clicked(mouseX, mouseY)) {
    theValue = "O";
    population = new Population(mutationRate, popmax);
  }
  if (pB.clicked(mouseX, mouseY)) {
    theValue = "P";
    population = new Population(mutationRate, popmax);
  }
  if (qB.clicked(mouseX, mouseY)) {
    theValue = "Q";
    population = new Population(mutationRate, popmax);
  }
  if (rB.clicked(mouseX, mouseY)) {
    theValue = "R";
    population = new Population(mutationRate, popmax);
  }
  if (sB.clicked(mouseX, mouseY)) {
    theValue = "S";
    population = new Population(mutationRate, popmax);
  }
  if (tB.clicked(mouseX, mouseY)) {
    theValue = "T";
    population = new Population(mutationRate, popmax);
  }
  if (uB.clicked(mouseX, mouseY)) {
    theValue = "U";
    population = new Population(mutationRate, popmax);
  }
  if (vB.clicked(mouseX, mouseY)) {
    theValue = "V";
    population = new Population(mutationRate, popmax);
  }
  if (wB.clicked(mouseX, mouseY)) {
    theValue = "W";
    population = new Population(mutationRate, popmax);
  }
  if (xB.clicked(mouseX, mouseY)) {
    theValue = "X";
    population = new Population(mutationRate, popmax);
  }
  if (yB.clicked(mouseX, mouseY)) {
    theValue = "Y";
    population = new Population(mutationRate, popmax);
  }
  if (zB.clicked(mouseX, mouseY)) {
    theValue = "Z";
    population = new Population(mutationRate, popmax);
  }
//  population.clicked(mouseX, mouseY);
}

void mouseReleased() {
  button.released();
  button2.released();
  aB.released();
  bB.released();
  cB.released();
  dB.released();
  eB.released();
  fB.released();
  gB.released();
  hB.released();
  iB.released();
  jB.released();
  kB.released();
  lB.released();
  mB.released();
  nB.released();
  oB.released();
  pB.released();
  qB.released();
  rB.released();
  sB.released();
  tB.released();
  uB.released();
  vB.released();
  wB.released();
  xB.released();
  yB.released();
  zB.released();
}

public void textA(String _theValue) {
  theValue = _theValue;
  population = new Population(mutationRate, popmax);
}

void keyPressed() {
  if (key=='P') {
    recording = true;
  }
}
