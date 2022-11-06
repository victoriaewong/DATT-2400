void setup(){
  size(600,600);
  noFill();
  rectMode(CENTER);
}

void draw(){
   
  background(0);
  stroke(255);
  for(int a = 200; a > 0; a-=10){
    strokeWeight(abs(sin(a+frameCount*0.05))*4);
    stroke(252,252,252);
    rect(width/2,height/2,a,a);
  }
  for(int b = 100; b > 0; b-=10){
    strokeWeight(abs(sin(b+frameCount*0.05))*4);
    translate(-50,-50);
    stroke(245,55,34);
    rect(width/2,height/2,b,b);
  }
  for(int c = 100; c > 0; c-=10){
    strokeWeight(abs(sin(c+frameCount*0.05))*4);
    translate(50,50);
    stroke(245,66,209);
    rect(width/2,height/2,c,c);
  }
  for(int d = 100; d > 0; d-=10){
    strokeWeight(abs(sin(d+frameCount*0.05))*4);
    translate(50,50);
    stroke(66,245,230);
    rect(width/2,height/2,d,d);
  }
  for(int e = 100; e > 0; e-=10){
    strokeWeight(abs(sin(e+frameCount*0.05))*4);
    translate(-50,-50);
    stroke(13,125,230);
    rect(width/2,height/2,e,e); 
  }
  for(int f = 100; f > 0; f-=10){
    strokeWeight(abs(sin(f+frameCount*0.05))*4);
    translate(50,-50);
    stroke(66,245,87);
    rect(width/2,height/2,f,f);
  }
  for(int g = 100; g > 0; g-=10){
    strokeWeight(abs(sin(g+frameCount*0.05))*4);
    translate(-50,50);
    stroke(22,168,115);
    rect(width/2,height/2,g,g);
}
  for(int h = 100; h > 0; h-=10){
    strokeWeight(abs(sin(h+frameCount*0.05))*4);
    translate(-50,50);
    stroke(242,240,114);
    rect(width/2,height/2,h,h);
}
  for(int i = 100; i > 0; i-=10){
    strokeWeight(abs(sin(i+frameCount*0.05))*4);
    translate(50,-50);
    stroke(227,173,57);
    rect(width/2,height/2,i,i); 
  }
  for(int k = 100; k > 0; k-=10){
    strokeWeight(abs(sin(k+frameCount*0.05))*4);
    stroke(252,252,252);
    rect(width/2,height/2,k,k);
}

saveFrame("####_out.png");
}
