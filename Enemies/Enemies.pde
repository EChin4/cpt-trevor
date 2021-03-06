//global variables
float x = 150;
float y = 100;
float speed = 5;
int wait = 2000;
boolean reload;
long reloadStartTime;
float zombieSpeed = 1;
Boolean started = false;
PVector zombieDude;

int rad = 250;
float theta = 0;
PVector enemy, player, projectile, target;


Player p1 = new Player(150, 100, 10, 10);
Enemy e1 = new Enemy(500, 500, 1, 1);

void setup() {
  size(600,600);
  zombieDude = new PVector(random(width), random(height), 0.);
  ellipseMode(CENTER);
  noStroke();
  fill(255, 0,0);
}
  

void draw() {
  background(255);
  display();
  
  fill(255, 0, 0, 100);
  ellipse(mouseX, mouseY, 10, 10); //aim
  
  text("Health", 20, 10);
  text(p1.health, 20 ,20);
  text("Ammo", 20, 30);
  text(p1.maxAmmo, 20, 40);
  
  // i didnt know how to make an object follow player so i copied most of this code https://forum.processing.org/one/topic/how-do-i-get-objects-to-follow-a-separate-moving-object.html
 
  ellipse(zombieDude.x, zombieDude.y,15, 15);
  float angle = atan2(p1.y-zombieDude.y, p1.x-zombieDude.x);
  float newX = cos(angle)*zombieSpeed + zombieDude.x;
  float newY = sin(angle)*zombieSpeed + zombieDude.y;
  zombieDude.set(newX, newY, 0.);
  
  if(p1.y==zombieDude.y && p1.x==zombieDude.x){
    p1.health = p1.health - 1;
  }
    
  
  
}
    


//character display

  
void display() {
  fill(0,0,0);
    ellipse(p1.x, p1.y, 50, 50);
    if(x > width - 25){
      p1.x = width -25;
    }if(y > height){
      p1.y = height - 25;
    }if(p1.x < 0 + 25){
      p1.x = 0 + 25;
    }if(p1.y < 0 + 25){
      p1.y = 0 + 25;
    }
    
if (reload) {
  if (millis() > (reloadStartTime + wait)) {
    p1.maxAmmo= 10;
    reload = false;
  }
  
}

//enemy display
  fill(255,0,0);
    ellipse(e1.x, e1.y, 30, 30);
    
}
void keyPressed() {
   if(key == 'r') {
       reload = true;
       reloadStartTime = millis();
    }
  if(key == 'w') {
  p1.y = p1.y - speed;
}
  if(key == 's') {
  p1.y = p1.y + speed;
}
  if(key == 'a') {
  p1.x = p1.x -speed;
}
  if(key == 'd') {
    p1.x = p1.x +speed;
}
 
  
}
  void mousePressed() {
    if (mousePressed == true) {
      p1.maxAmmo -= 1;
    }
    if (p1.maxAmmo < 0) {
      p1.maxAmmo = 0;
  }
  }
class Player {
  public float x;
  public float y;
  public int health;
  public int maxAmmo;
 

  public Player(float x, float y, int health, int maxAmmo) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.maxAmmo = maxAmmo;
  }
}
class Enemy {
    public float x;
    public float y;
    public int health;
    public int damage;
  
  public Enemy(float x, float y, int health, int damage) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.damage = damage;
  }


}