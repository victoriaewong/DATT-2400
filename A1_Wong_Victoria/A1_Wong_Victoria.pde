int cols = 20;
int rows = 20;

int stepx, stepy;

int rand_switch = 3;

void setup() {

  size(600, 600);
  
  stepx = (width/cols);
  stepy = (height/cols);
}

void draw() {
  background(0);
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      fill(200);
      strokeWeight(1);

      float xp = x*stepx;
      float yp = y*stepy;

      int offset = stepx/2;

      int method = 0;

      switch (method) {
      case 0:

        rand_switch = int(random(4));
        break;

      case 1:

        rand_switch = int(map (tan((x+offset)+(y+offset)*frameCount*0.001), -1, 1, 0, 4));
        break;

      case 2:

        float distance = dist(width/2, height/2, xp, yp) + sin(frameCount*0.05)*200;

        rand_switch = int(map(distance, 0, width/2+(offset), 0, 3)) ;
        break;
      }
      fill(204,204,255);

      if (rand_switch == 0) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(0), radians(90));
      }
     fill(238,127,159);

      if (rand_switch == 1) {
        pushMatrix();
        translate(offset+xp, offset+yp);
        rotate(frameCount*0.1);
        arc(0,0, stepx,stepy, radians(90), radians(180));
        popMatrix();
      }
      fill(255,200,200);

      if (rand_switch == 2) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(180), radians(270));
      }
      fill(151,229,193);
      
      if (rand_switch == 3) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(270), radians(360));
      }
 
    }
  }
  fill(200);
  noFill();
  stroke(237,172,211);
  strokeWeight(70);
  rectMode(CENTER);
  pushMatrix();
  translate(width/2,height/2);
  rotate(frameCount*0.01);
  rect(0, 0, mouseX, mouseY);
  popMatrix();
  
  fill(200);
  noFill();
  stroke(120,247,243);
  strokeWeight(70);
  pushMatrix();
  translate(width*0.5,height*0.5);
  rotate(frameCount / -100.0);
  star(0, 0, 30, 70, 5); 
  popMatrix();
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
