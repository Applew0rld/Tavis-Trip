class EBullet{
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
 
 EBullet(int startX,int startY){
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
      x -= speed;
   
      top = y - d/2;
      bottom = y + d/2;
      left = x - d/2;
      right = x + d/2;
 }
 
 void checkRemove(){
  if (x - d/2 <= 0){
   shouldRemove = true; 
  }
 }
 
 void shootPlayer(Player aPlayer){
   ///bullet + player = die!!!!!
   if (top <= aPlayer.bottom &&
       bottom >= aPlayer.top &&
       left <= aPlayer.right &&
       right >= aPlayer.left){
         println("yeouch!");
         hp -= 1;
         enemyDEAD.play();
         enemyDEAD.rate(3.0);
         shouldRemove = true; 
  }
 }
}
