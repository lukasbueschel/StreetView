
void addLandmark() {
  pushMatrix();
  translate(70,500,0);
  // draw all four sides of the tower
  for(int i=0; i<4; i++) {
    rotateZ(PI/2);
    side();
    translate(50,0,0);
  }
  popMatrix();
}

void side() {
  fill(c);
  stroke(255);
  beginShape();
  vertex(0,0,0);
  vertex(0,0,180);
  vertex(50,0,180);
  vertex(50,0,0);
  endShape(CLOSE);
  
  beginShape();
  vertex(0,0,180);
  vertex(-1,-1,183);
  vertex(-5,-5,190);
  vertex(55,-5,190);
  vertex(51,-1,183);
  vertex(50,0,180);
  endShape(CLOSE);
  
  fill(255);
  noStroke();
  // draw three windows per side
  int h=50;
  for(int i=0; i<3; i++) {
    pushMatrix();
    translate(12+i*10,0,110);
    beginShape();
    vertex(0,-1,0);
    vertex(0,-1,h-1);
    vertex(2,-1,h+2);
    vertex(2,-1,h+3);
    vertex(0,-1,h+3);
    vertex(0,-1,h+5);
    vertex(2,-1,h+5);
    vertex(2,-1,h+8);
    vertex(4,-1,h+8);
    vertex(4,-1,h+5);
    vertex(6,-1,h+5);
    vertex(6,-1,h+3);
    vertex(4,-1,h+3);
    vertex(4,-1,h+2);
    vertex(6,-1,h-1);
    vertex(6,-1,0);
    endShape(CLOSE);
    popMatrix();
  }
  
  strokeWeight(3);
  fill(255);
  stroke(c);
}
