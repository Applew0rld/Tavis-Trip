class Platform{
 int x;
 int y;
 int w;
 int h;
 
 int top;
 int bottom;
 int left;
 int right;
 
 //constructor
 Platform (int startX, int startY){
   rectMode(CENTER);
  x = startX;
  y = startY;
  w = 150;
  h = 10;
  
  top = y - h/2;
  bottom = y + h/2;
  left = x - w/2;
  right = x + w/2;
 }
 
 void render(){
   fill(230);
  rect(x, y, w, h); 
 }
 
 void collide(Player aPlayer){
  if (top <= aPlayer.bottom &&
       bottom >= aPlayer.top &&
       left <= aPlayer.right &&
       right >= aPlayer.left){
         aPlayer.isFalling = false;
         aPlayer.bottom = top;
       }
 }
}
