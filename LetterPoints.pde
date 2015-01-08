class LetterPoints {
  DNA dna;          // LetterPoints DNA
  float fitness;    // How good is this Letter?
  float x, y;       // Position on screen
  int wh = 180;      // Size of square enclosing face
  boolean rollover; // Are we rolling over this face?
//  boolean clicked;

  PVector pos = new PVector();
  PVector tpos = new PVector();

  Rectangle r;

  RGroup myGroup = font.toGroup(theValue); 
  RPoint[] myPoints = myGroup.getPoints();

  int seed = 0;

  LetterPoints(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_;
    y = y_;
    fitness = 1;
    seed = int(random(100000));

    r = new Rectangle(int(x), int(y), int(wh), int(wh));
  }
  
  void update () {
    //pos.x = lerp(pos.x, tpos.x, 0.1);
    //pos.y = lerp(pos.y, tpos.y, 0.1);
  }

  void display() {
    randomSeed(seed);
    float letterWidth = map(dna.genes[0], 0, 1, 0, 3);
    float letterHeight = map(dna.genes[1], 0, 1, 0, 2);
    float letterR = map(dna.genes[2], 0, 1, 0, 250);
    float letterG = map(dna.genes[3], 0, 1, 0, 250);
    float letterB = map(dna.genes[4], 0, 1, 0, 250);
    float letterAlpha = map(dna.genes[5], 0, 1, 50, 100);
    float letterRandomXHigh = map(dna.genes[6], 0, 1, 1, 1.5);
    float letterRandomYHigh = map(dna.genes[7], 0, 1, 1, 1.5);
    float letterRandomXLow = map(dna.genes[8], 0, 1, 0.5, 1);
    float letterRandomYLow = map(dna.genes[9], 0, 1, 0.5, 1);
    float letterStrokeWeight = map(dna.genes[10], 0, 1, 0.5, 15);
    float letterNoise = map(dna.genes[11], 0, 1, 0.01, 0.03);


    pushMatrix();
    translate(x + (wh/2), y + (wh - 10));

    noStroke();
    beginShape();
    for (int i=0; i<myPoints.length; i++) {
      fill(letterR, letterG, letterB, letterAlpha);
      // slight change: adjusting width & height
      vertex(myPoints[i].x * letterWidth, myPoints[i].y * letterHeight);

      //extreme change: randomizing vertex points
      vertex(myPoints[i].x * random(letterRandomXLow, letterRandomXHigh), myPoints[i].y * random(letterRandomYLow, letterRandomYHigh));
      
    }
    endShape();

    // Divide points into sections
    /*beginShape();
     for (int i=0; i<myPoints.length/3; i++) {
     strokeWeight(1);
     stroke(letterR, letterG, letterB, letterAlpha);
     fill(letterR, letterG, letterB, letterAlpha);
     vertex(myPoints[i].x * random(letterRandomXLow, letterRandomXHigh), myPoints[i].y * random(letterRandomYLow, letterRandomYHigh));
     }
     endShape();
     
     beginShape();
     smooth();
     for (int i=myPoints.length/3; i<myPoints.length; i++) {
     strokeWeight(1);
     stroke(letterR, letterG, letterB, letterAlpha);
     fill(letterR, letterG, letterB, letterAlpha);
     vertex(myPoints[i].x * letterWidth, myPoints[i].y * letterHeight);
     }
     endShape();*/

    /*beginShape();
     smooth();
     for (int i=(myPoints.length/3)*2; i<myPoints.length; i++) {
     strokeWeight(1);
     stroke(letterR, letterG, letterB, letterAlpha);
     vertex(myPoints[i].x * letterWidth, myPoints[i].y * letterHeight);
     }
     endShape();*/

    pushMatrix();
    noStroke();
    strokeWeight(0.25);
    if (rollover) fill(0, 0);
//    if (clicked) fill(0, 0);
    else noFill();
    rectMode(CORNER);
    rect(-wh/2, -wh+10, wh, wh);
    popMatrix();

    // Display fitness value
    textAlign(CENTER);
    textFont(fBold, 35);
    if (rollover) {
      fill(0, 50);
      ellipse(2, -210, 80, 80);
      fill(255);
      text(int(fitness), 0, -200);
//    } else
//    if (clicked) {
//      fill(0, 50);
//      ellipse(2, -210, 80, 80);
//      fill(255);
//      text(int(fitness), 0, -200);
    } else {
      fill(220);
      text(int(fitness), 0, 45);
    }

    popMatrix();

    noStroke();
    noFill();
    rect(r.x, r.y, r.width, r.height);
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  // Increment fitness if mouse is rolling over face
  void rollover(int mx, int my) {
    if (r.contains(mx, my)) {
      rollover = true;
      fitness += 0.25;
    } 
    else {
      rollover = false;
    }
  }

//  void clicked(int mx, int my) {
//    if (r.contains(mx,my)) {
//      clicked = true;
//    }
//  }
}

