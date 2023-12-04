class Enemy{
 ///vars
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
 
  Enemy(int startX, int startY, int startW, int startH){
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
  
  void render(){
    fill(0, 255, 0);
    rect(x, y, w, h);
  }
  
   void move(){
  if (isMovingLeft == true){
    x -= speed;
  }
  if (isMovingRight == true){
    x += speed;
  }
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
 
 void land(){
  if (y >= height - h/2){
    isFalling = false;
    y = height - h/2; //snap player to posistion
  }
 }
 
 ///void 
///}

}
