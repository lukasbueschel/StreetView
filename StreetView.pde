float d;
int m = 20;
color c = color(200);

void setup() {
  size(1024, 768, P3D);
  noLoop();
}

void draw() {
  background(255);
  /* The coordinate system of Processing is completely
   * different to OpenGL, neither left- nor right-handed.
   * Therefore I rotate it so I can handle it in my brain. */
  rotateX(radians(90));
  
  camera(
      0, 0, 10,
      cos(radians(d))*m, sin(radians(d))*m, 10,
      0, 0, -1);
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(PI/3.0, width/height, cameraZ/100.0, cameraZ*5.0);
  
  renderScene(); // world.pde
  
  // the navigation cursor
  fill(#0066ff);
  stroke(255);
  strokeWeight(18);
  pushMatrix();
  translate(cos(radians(d))*m, sin(radians(d))*m,0);
  scale(0.2);
  rotateZ(radians(-5));
  beginShape();
  vertex(-10,0,0);
  vertex(0,30,0);
  vertex(0,7,0);
  endShape(CLOSE);
  beginShape();
  vertex(0,30,0);
  vertex(10,0,0);
  vertex(0,7,0);
  endShape(CLOSE);
  popMatrix();
}

// keyboard input :

void keyPressed() {
  if (keyCode == LEFT) {
    d-=5;
  } else if(keyCode == RIGHT) {
    d+=5;
  }
  d=d%360;
  if(d<0)
    d+=360;
  
  redraw();
}

// mouse input : 

int sx, dx, tempX;
float dir, temp;

void mousePressed() {
  sx = mouseX;
}

void mouseReleased() {
  sx = -1;
}

void mouseDragged() {
  dx = mouseX;
  tempX = dx;
  dir = (dx - sx) * 0.02;
  // if direction has changed  (not jet perfected)
  if((temp < 0 && dir > 0) || temp > 0 && dir < 0) {
    sx = tempX;
    dir = (dx - sx) * 0.02;
  }
  d = d + dir;
  temp = dir;
  
  redraw();
}

