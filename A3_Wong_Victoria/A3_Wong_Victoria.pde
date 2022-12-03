//Sound
SoundFile[] file;
int numsounds = 5;

//PVector add
PVector pos;
PVector acc;

//Snowfall
ArrayList<Snowflake> snow;
PVector gravity;

float zOff = 0;

PImage spritesheet;
ArrayList<PImage> textures;

//Building
Building[] build;

int num=40;

void setup() {
  size(800,600);
  
//Sound
  file = new SoundFile[numsounds];
  for (int a = 0; a < numsounds; a++){
    file[a] = new SoundFile(this,"Wind/" + (a+1) + ".wav");
  }
  
//Snowfall
  spritesheet = loadImage("flakes32.png");
  
  snow = new ArrayList<Snowflake>();
  textures = new ArrayList<PImage>();
  gravity = new PVector(0, 0.3);
  for (int x = 0; x < spritesheet.width; x += 32) {
    for (int y = 0; y < spritesheet.height; y += 32) {
      PImage img = spritesheet.get(x, y, 32, 32);
      image(img, x, y);
      textures.add(img);
    }
//PVector add
  pos = new PVector(random(width), random(height), random(5,70));
  acc = new PVector(1,3,0.0);
  
  }
  
//Snowfall
  for (int i = 0; i < 400; i++) {
    float x = random(width);
    float y = random(height);
    int designIndex = floor(random(textures.size()));
    PImage design = textures.get(designIndex);
    snow.add(new Snowflake(x, y, design));
  }
  
//Building
  build = new Building[num];
  
  for(int i = 0; i < num; i++){
    build[i] = new Building(random(width),random(height),random(150),random(height/2));
  }
}

void draw() {
  background(0);
  stroke(255);
  fill(159, 184, 224);
  
  //PVector add
  pos.add(acc);
  
 
  if( (pos.x > width) || (pos.x <0)){
    
    acc.x = acc.x * -1;
    
  }
  
  if( (pos.y > height) || (pos.y < 0)){
    
    acc.y = acc.y * -1;
    
  }
  
  ellipse(pos.x, pos.y, pos.z, pos.z);
  
//Snowfall
  zOff += 0.1;

  for (int i = 0; i < snow.size(); i++) {
    Snowflake flake = snow.get(i);
    float xOff = flake.pos.x / width;
    float yOff = flake.pos.y / height;
    float wAngle = noise(xOff, yOff, zOff) * TWO_PI;
    PVector wind = PVector.fromAngle(wAngle);
    wind.mult(0.1);

    flake.applyForce(gravity);
    flake.applyForce(wind);
    flake.update();
    flake.render();
  }

//Building
  for(int i = 0; i < num; i++){
  build[i].draw_building();
  build[i].mover();
  }
}

//Sound
    void keyPressed() {

  boolean validKey = true;

  switch(key) {
  case 'a':
    file[0].play(0.5, 1.0);
    break;

  case 's':
    file[1].play(0.5, 1.0);
    break;

  case 'd':
    file[2].play(0.5, 1.0);
    break;

  case 'f':
    file[3].play(0.5, 1.0);
    break;

  case 'g':
    file[4].play(0.5, 1.0);
    break;

  case 'h':
    file[0].play(1.0, 1.0);
    break;

  case 'j':
    file[1].play(1.0, 1.0);
    break;

  case 'k':
    file[2].play(1.0, 1.0);
    break;

  case 'l':
    file[3].play(1.0, 1.0);
    break;

  case ';':
    file[4].play(1.0, 1.0);
    break;

  case '\'':
    file[0].play(2.0, 1.0);
    break;

  case 'q':
    file[1].play(2.0, 1.0);
    break;

  case 'w':
    file[2].play(2.0, 1.0);
    break;    

  case 'e':
    file[3].play(2.0, 1.0);
    break;

  case 'r':
    file[4].play(2.0, 1.0);
    break; 

  case 't':
    file[0].play(3.0, 1.0);
    break;

  case 'y':
    file[1].play(3.0, 1.0);
    break;

  case 'u':
    file[2].play(3.0, 1.0);
    break;    

  case 'i':
    file[3].play(3.0, 1.0);
    break;

  case 'o':
    file[4].play(3.0, 1.0);
    break;

  case 'p':
    file[0].play(4.0, 1.0);
    break;    

  case '[':
    file[1].play(4.0, 1.0);
    break;

    // no valid key was pressed, store that information
  default:
    validKey = false;
  }
}

//Building
class Building {
  
  float x;
  float y;
  
  float w;
  float h;
  
  int windows;
  
  float speed = random(7);
  
  float opacity = random(255);
  color c = color (random(255), random(255), random(255), random(255));
  
  Building(float x, float y, float w, float h) {
    
    this.x = x;
    this.y = y;
    
    this.w = w;
    this.h = h;
}
  
  void draw_building(){
  noStroke();
  fill(c);
    ellipse(x,y,w,h);
  }

void mover() {
  x+=speed;
  x = x%width;
  }
}
