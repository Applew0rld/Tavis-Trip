class Bullet{
 ///class vars
 int x;
 int y;
 int d;
 
 int speed;
 
 boolean shouldRemove;
 
 //hitbox vars
 int top;
 int bottom;
 int left;
 int right;
 
 ///constructor
 
 Bullet(int startX,int startY){
  x = startX;
  y = startY;
  d = 10;
  
  speed = 20;
  
  shouldRemove = false;
  
  top = y - d/2;
  bottom = y + d/2;
  left = x - d/2;
  right = x + d/2;
 }
 
 void render(){
  fill(255, 0, 0);
  circle(x, y, d); 
 }
 
 void move(){
   x += speed;
   
  top = y - d/2;
  bottom = y + d/2;
  left = x - d/2;
  right = x + d/2;
 }
 
 void checkRemove(){
  if (x + d/2 >= width){
   shouldRemove = true; 
  }
 }
 
 void shootEnemy(Enemy anEnemy){
   ///bullet + enemy = die!!!!!
   if (top <= anEnemy.bottom &&
       bottom >= anEnemy.top &&
       left <= anEnemy.right &&
       right >= anEnemy.left){
         println("ow!");
         anEnemy.shouldRemove = true;
         shouldRemove = true;
         enemyDEAD.play();
         enemyDEAD.rate(3.0);
  }
 }
}
