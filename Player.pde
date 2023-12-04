class Player{
 ///class vars
 int x;
 int y;
 int w;
 int h;
 
  int top;
 int bottom;
 int left;
 int right;
 
 boolean isMovingLeft;
 boolean isMovingRight;
 
 int speed;
 
 //jumping vars
 boolean isJumping;
 boolean isFalling;
 
 int jSpeed;
 
 int jumpHeight;
 int highestY;
 
 boolean shouldRemove;
 
 ///constructor
 Player(int startX, int startY, int startW, int startH){
   x = startX;
   y = startY;
   w = startW;
   h = startH;
   
   top = y - h/2;
   bottom = y + h/2;
   left = x - w/2;
   right = x + w/2;
   
   isMovingLeft = false;
   isMovingRight = false;
   
   speed = 5;
   
   isJumping = false;
   isFalling = false;
   
   jSpeed = 10;
   
   jumpHeight = 100;
   highestY = y - jumpHeight;
   
   shouldRemove = false;
 }
 
 ///functions
 void render(){
   fill(#D6991E);
   rect(x, y, w, h);
 }
 
 void move(){
  if (isMovingLeft == true){
    x -= speed;
  }
  if (isMovingRight == true){
    x += speed;
  }
   top = y - h/2;
   bottom = y + h/2;
   left = x - w/2;
   right = x + w/2;
 }
 
 void jump(){
  if (isJumping == true){
   y -= jSpeed; 
  }
 }
 
 void fall(){
  if (isFalling == true){
    y += jSpeed;
  }
 }
 
 void topOfJump(){
   if (y <= highestY){
     isJumping = false;
     isFalling = true;
  }
 }
 
 void win(){
  if (right >= width){
      state += 1;
      x = 0;
      y = 100;
      jump();
   }
 }


 void die(){
  if (top >= height - h/2){
    isFalling = true;
    state = 5;
  }
  if (hp <= 0){
   state = 5; 
  }
 }
 
 //check if player is colliding with platform, if not, she falls!
 void fallOffPlat(ArrayList<Platform> aPlatList){
   if (isJumping == false &&
       bottom < height){
         boolean onPlat = false;
         
         for (Platform aPlat : aPlatList){
          if (top <= aPlat.bottom &&
              bottom >= aPlat.top &&
              left <= aPlat.right &&
              right >= aPlat.left){
               onPlat = true; 
              }
         }
         
         if (onPlat == false){
          isFalling = true; 
         }
         
  }
 }
 
}
