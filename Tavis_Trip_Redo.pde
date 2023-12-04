///11/27/23: Had to switch things up a bit, so the game is a bit different now!
import processing.sound.*;


//declaring variables

///art
PImage startscreen;
PImage winscreen;
PImage losescreen;

///Tavi Vars and her Bullets!
Player p1;
Bullet b1;

//Enemy bullet vars!
EBullet eb1;

 //shoot timer vars
 int timePassed;
 int startTime;
 int currentTime;
 int interval = 500;

///////Level 1
///Level 1 Platforms
Platform plat0;
Platform plat1;
Platform plat2;
Platform plat3;
Platform plat4;
Platform plat5;
Platform plat6;
Platform plat7;

///Level 1 Enemies
Enemy e1;
Enemy e2;
Enemy e3;
Enemy e4;

/////Level 2
///Level 2 Platforms
Platform plat75;
Platform plat8;
Platform plat9;
Platform plat10;
Platform plat11;
Platform plat12;
Platform plat13;

///Level 2 Enemies
Enemy e5;
Enemy e6;
Enemy e7;
Enemy e8;
Enemy e9;
Enemy e10;

///Level 3 Platforms
Platform plat14;
Platform plat15;
Platform plat16;
Platform plat17;
Platform plat18;
Platform plat19;

///Level 3 Enemies
Enemy e11;
Enemy e12;
Enemy e13;
Enemy e14;

///health bar vars
int hp = 100;
int hpx = width/4;
int hpy = 0 + 100;

ArrayList<Bullet> bulletList;
ArrayList<EBullet> enemybList;

////Enemy Arrays
ArrayList<Enemy> enemyList;
ArrayList<Enemy> enemyList2;
ArrayList<Enemy> enemyList3;

////Platform Arrays
ArrayList<Platform> platformList;
ArrayList<Platform> platformList2;
ArrayList<Platform> platformList3;

SoundFile fancy;
SoundFile enhyphenBGM;
SoundFile enemyDEAD;
SoundFile playerJump;
SoundFile spooky;

///switch state vars
int state = 0;


void setup(){
  size(1200, 600);
  rectMode(CENTER);
      //art
      startscreen = loadImage("Tavi Start Screen.png");
      winscreen = loadImage("Tavi Win Screen.png");
      losescreen = loadImage("Tavi Lose Screen.png");
      imageMode(CENTER);

       
       //player
       p1 = new Player(0, 0, 50, 100);
       
     
       bulletList = new ArrayList<Bullet>();
       enemybList = new ArrayList<EBullet>();
       
       ///init bullet time vars
       startTime = millis();
       currentTime = millis();
       interval = 1000;
     
       ///////Levels!
       //////Level 1
       ///Level 1 Platforms
       plat0 = new Platform(75, 150);
       plat1 = new Platform(width/2, 575);
       plat2 = new Platform((width/2) + 100, 525);
       plat3 = new Platform(width/4, 250);
       plat4 = new Platform(450, 350);
       plat5 = new Platform(900, 450);
       plat6 = new Platform(1110, 400);
       plat7 = new Platform(1200, 400);
       platformList = new ArrayList<Platform>();
       
       
       platformList.add(plat1);
       platformList.add(plat2);
       platformList.add(plat3);
       platformList.add(plat4);
       platformList.add(plat5);
       platformList.add(plat6);
       platformList.add(plat7);
       
       ///Level 1 Enemies
       e1 = new Enemy(450, 300, 50, 100);
       e2 = new Enemy(900, 400, 50, 100);
       e3 = new Enemy(1110, 350, 50, 100);
       e4 = new Enemy(width/4, 200, 50, 100);
       enemyList = new ArrayList<Enemy>();
       
       enemyList.add(e1);
       enemyList.add(e2);
       enemyList.add(e3);
       enemyList.add(e4);
       
       //////Level 2
       ///Level 2 Platforms
       plat75 = new Platform(75, 200);
       plat8 = new Platform(75, 500);
       plat9 = new Platform(300, 450);
       plat10 = new Platform(500, 350);
       plat11 = new Platform(750, 450);
       plat12 = new Platform(1000, 400);
       plat13 = new Platform(1150, 350);
       platformList2 = new ArrayList<Platform>();
       
       platformList2.add(plat8);
       platformList2.add(plat9);
       platformList2.add(plat10);
       platformList2.add(plat11);
       platformList2.add(plat12);
       platformList2.add(plat13);
       
       ///Level 2 Enemies
       e5 = new Enemy(225, 400, 25, 100);
       e6 = new Enemy(275, 400, 25, 100);
       e7 = new Enemy(500, 300, 25, 100);
       e8 = new Enemy(750, 400, 25, 100);
       e9 = new Enemy(1000, 350, 25, 100);
       e10 = new Enemy(1100, 350, 25, 100);
       enemyList2 = new ArrayList<Enemy>();
       
       enemyList2.add(e5);
       enemyList2.add(e6);
       enemyList2.add(e7);
       enemyList2.add(e8);
       enemyList2.add(e9);
       enemyList2.add(e10);
       
       ///Level 3 Platforms
       plat14 = new Platform(75, 150);
       plat15 = new Platform(400, 500);
       plat16 = new Platform(550, 400);
       plat17 = new Platform(700, 300);
       plat18 = new Platform(1000, 550);
       plat19 = new Platform(1200, 500);
       platformList3 = new ArrayList<Platform>();
       
       platformList3.add(plat15);
       platformList3.add(plat16);
       platformList3.add(plat17);
       platformList3.add(plat18);
       platformList3.add(plat19);
       
       ///Level 3 Enemies
       e11 = new Enemy(400, 450, 50, 100);
       e12 = new Enemy(525, 350, 25, 100);
       e13 = new Enemy(700, 250, 50, 100);
       e14 = new Enemy(1000, 500, 25, 100);
       enemyList3 = new ArrayList<Enemy>();
       
       enemyList3.add(e11);
       enemyList3.add(e12);
       enemyList3.add(e13);
       enemyList3.add(e14);
  
  fancy = new SoundFile(this, "Fancy (Chip Bloom Mix).wav");
  enhyphenBGM = new SoundFile(this, "ENHYPEN TAMEDDASHED OFFICIAL INSTRUMENTAL.mp3");
  enemyDEAD = new SoundFile(this, "bonesCrackin.mp3");
  playerJump = new SoundFile(this, "Vine boom sound effect.mp3");
  spooky = new SoundFile(this, "Sleepwalker.mp3");
}

void draw(){
  background(230);
  //println(state);
  
  ///switch states
  switch(state){
     ///start screen 
     case(0):
     image(startscreen, width/2, height/2);
     //fancy.play();
     break;
     
     case(1):
  
  //health bar
    fill(50);
    textSize(50);
    text(hp, 50, 50);
  
  //platform functions for loop
  plat0.render();
  plat0.collide(p1);
  
  for (Platform aPlatform : platformList){
   aPlatform.render();
   aPlatform.collide(p1);
  }
  
  
  //player functions
  p1.render();
  p1.move();
  p1.jump();
  p1.fall();
  p1.topOfJump();
  p1.win();
  p1.die();
  p1.fallOffPlat(platformList);
  
  ///enemy functions
  for (Enemy anEnemy : enemyList){
    anEnemy.render();
    anEnemy.move();
    anEnemy.jump();
    anEnemy.fall();
    anEnemy.topOfJump();
    anEnemy.land();
  }
  
  //bullet functions
  for (Bullet anyBullet : bulletList){
    anyBullet.render();
    anyBullet.move();
    anyBullet.checkRemove();
  
    for (Enemy anEnemy : enemyList){
       anyBullet.shootEnemy(anEnemy); 
    }
  }
  
  ///enemy bullet functions
  for (EBullet anEBullet : enemybList){
   anEBullet.render();
   anEBullet.move();
   anEBullet.checkRemove();
   anEBullet.shootPlayer(p1);
  }
  
  currentTime = millis();
  if (currentTime - startTime > interval){
   enemybList.add(new EBullet(e1.x, e1.y));
   enemybList.add(new EBullet(e2.x, e2.y));
   enemybList.add(new EBullet(e3.x, e3.y));
   enemybList.add(new EBullet(e4.x, e4.y));
   startTime = millis();
   println("test");
  }
  
  //for loop that removes the unwanted bullets
  for (int i = bulletList.size() - 1; i >= 0; i-=1){
    Bullet anyBullet = bulletList.get(i);
    
    if (anyBullet.shouldRemove == true){
     bulletList.remove(anyBullet); 
    }
  }
  //for loop that kills enemies
    for (int i = enemyList.size() - 1; i >= 0; i-=1){
    Enemy anEnemy = enemyList.get(i);
    
    if (anEnemy.shouldRemove == true){
     enemyList.remove(anEnemy); 
    }
      ///music statements
      fancy.stop();
  if (enhyphenBGM.isPlaying() == false){
    enhyphenBGM.play();
    enhyphenBGM.rate(1.3);
  }
  }
  break;
  
    case(2):
    background(#BEE0E8);
    fill(50);
    textSize(50);
    text(hp, 50, 50);
    
    ///platform functions
    plat75.render();
    plat75.collide(p1);
      for (Platform anyPlatform : platformList2){
   anyPlatform.render();
   anyPlatform.collide(p1);
  }
   //player functions
  p1.render();
  p1.move();
  p1.jump();
  p1.fall();
  p1.topOfJump();
  p1.win();
  p1.die();
  p1.fallOffPlat(platformList2);
  
  ///enemy functions
  for (Enemy anEnemy : enemyList2){
    anEnemy.render();
    anEnemy.move();
    anEnemy.jump();
    anEnemy.fall();
    anEnemy.topOfJump();
    anEnemy.land();
  }
  
  //bullet functions
  for (Bullet anyBullet : bulletList){
    anyBullet.render();
    anyBullet.move();
    anyBullet.checkRemove();
  
    for (Enemy anEnemy : enemyList2){
       anyBullet.shootEnemy(anEnemy); 
    }
  }
  
  ///enemy bullet functions
  for (EBullet anEBullet : enemybList){
   anEBullet.render();
   anEBullet.move();
   anEBullet.checkRemove();
   anEBullet.shootPlayer(p1);
  }
    currentTime = millis();
  if (currentTime - startTime > interval){
   enemybList.add(new EBullet(e5.x, e5.y));
   enemybList.add(new EBullet(e6.x, e6.y));
   enemybList.add(new EBullet(e7.x, e7.y));
   enemybList.add(new EBullet(e8.x, e8.y));
   enemybList.add(new EBullet(e9.x, e9.y));
   enemybList.add(new EBullet(e10.x, e10.y));
   startTime = millis();
   println("test");
  }
  
  //for loop that removes the unwanted bullets
  for (int i = bulletList.size() - 1; i >= 0; i-=1){
    Bullet anyBullet = bulletList.get(i);
    
    if (anyBullet.shouldRemove == true){
     bulletList.remove(anyBullet); 
    }
  }
  //for loop that kills enemies
    for (int i = enemyList2.size() - 1; i >= 0; i-=1){
    Enemy anEnemy = enemyList2.get(i);
    
    if (anEnemy.shouldRemove == true){
     enemyList2.remove(anEnemy); 
    }
   }
    
    break;
    
    case(3):
    fill(230);
    textSize(50);
    text(hp, 50, 50);
    background(60);
    
    plat14.render();
    plat14.collide(p1);
  for (Platform anyPlatform : platformList3){
   anyPlatform.render();
   anyPlatform.collide(p1);
  }
   //player functions
    p1.render();
    p1.move();
    p1.jump();
    p1.fall();
    p1.topOfJump();
    p1.win();
    p1.die();
    p1.fallOffPlat(platformList2);
    
     ///enemy functions
  for (Enemy anEnemy : enemyList3){
    anEnemy.render();
    anEnemy.move();
    anEnemy.jump();
    anEnemy.fall();
    anEnemy.topOfJump();
    anEnemy.land();
  }
  
  //bullet functions
  for (Bullet anyBullet : bulletList){
    anyBullet.render();
    anyBullet.move();
    anyBullet.checkRemove();
  
    for (Enemy anEnemy : enemyList3){
       anyBullet.shootEnemy(anEnemy); 
    }
  }
  
  ///enemy bullet functions
  for (EBullet anEBullet : enemybList){
   anEBullet.render();
   anEBullet.move();
   anEBullet.checkRemove();
   anEBullet.shootPlayer(p1);
  }
    currentTime = millis();
  if (currentTime - startTime > interval){
   enemybList.add(new EBullet(e11.x, e11.y));
   enemybList.add(new EBullet(e12.x, e12.y));
   enemybList.add(new EBullet(e13.x, e13.y));
   enemybList.add(new EBullet(e14.x, e14.y));
   startTime = millis();
   println("test");
  }
  
  //for loop that removes the unwanted bullets
  for (int i = bulletList.size() - 1; i >= 0; i-=1){
    Bullet anyBullet = bulletList.get(i);
    
    if (anyBullet.shouldRemove == true){
     bulletList.remove(anyBullet); 
    }
  }
  //for loop that kills enemies
    for (int i = enemyList3.size() - 1; i >= 0; i-=1){
    Enemy anEnemy = enemyList3.get(i);
    
    if (anEnemy.shouldRemove == true){
     enemyList3.remove(anEnemy); 
    }
   }
  
    break;
  
    case(4):
    background(50);
    image(winscreen, width/2, height/2);
    enhyphenBGM.stop();
    if (fancy.isPlaying() == false){
      fancy.play();
    }
    break;
  
    case(5):
    background(50);
    image(losescreen, width/2, height/2);
    enhyphenBGM.stop();
    if (spooky.isPlaying() == false){
      spooky.play();
    }
    break;
    }
  

}

void keyPressed(){
  ///game start
  if (key == ' '){
    if (state == 4 || state == 5){
      state = 0;
      spooky.stop();
    }
    else{
   state = 1; 
   p1.x = 0;
   p1.y = 0;
   hp = 100;
    }
  }
  
  ///player 1 movement
 if (key == 'a'){
   p1.isMovingLeft = true;
 }
 
 if (key == 'd'){
   p1.isMovingRight = true;
 }
 
 if (key == 'w' && p1.isJumping == false && p1.isFalling == false){
  p1.isJumping = true; 
  p1.highestY = p1.y - p1.jumpHeight;
  playerJump.play();
 }
 
 if (key =='q'){
  bulletList.add(new Bullet(p1.x, p1.y));
 }
 
 ///shooting buttons
 if (key =='q'){
  bulletList.add(new Bullet(p1.x, p1.y));
 }
 
}

void keyReleased(){
  ///player 1
   if (key == 'a'){
   p1.isMovingLeft = false;
 }
 
 if (key == 'd'){
   p1.isMovingRight = false;
 }
}
