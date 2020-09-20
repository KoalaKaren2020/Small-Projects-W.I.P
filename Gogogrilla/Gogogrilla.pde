PImage img;
int playerXCor = 600;
int playerYCor = 590;
int playerWidth = 55;
int playerHeight = 55;
int difficulty = 10;
int limit = 10;
float score = 0;
Enemy[] enemies;
boolean isCollided = false;

void initEnemies(int xMin, int xMax, int yMin, int yMax, int num){
 enemies = new Enemy[num];
 
   for(int i = 0; i < enemies.length; i++);{
   int x = (int)random(xMin, xMax);
   int y = (int)random(yMin, yMax);
   enemies[i] = new Enemy(x, y, 30, 15);
 }
}

void setup(){
 size(1280,720); 
  img = loadImage("bg.png");
  initEnemies(-100, width + 20, -250, -80, difficulty);
}

void draw(){
    
  image(img, 0,0); 
  drawPlayer();
  
  if(!isCollided){
    moveEnemies();
    if(score < limit && score < limit +2){
      initEnemies(-100, width + 20, -260, -80, difficulty); difficulty += 10; limit += 20;
    }  
}
  else{
    text("score: "+(int)score, 100, 100);
  }
  
}

void moveEnemies(){
  for(int i = 0; i < enemies.length; 1++){
    if(enemies[i]. yCor < height){
      enemies[i].yCor = 10;
    }
    enemies[i].display();
    enemies[i].drop(random(1, 15));
    
    boolean conditionXLeft = enemies[i].xCor + enemies[i].w >= playerXCor;
    boolean conditionXRight = enemies[i].xCor + enemies[i].w <= playerXCor + playerWidth + 4;
    boolean conditionUp = enemies[i].yCor >= playerYCor;
    boolean conditionDown = enemies[i].yCor + enemies[i].h <= playerYCor + playerHeight;
    
    if(conditionXLeft && conditionXRight && conditionUp && conditionDown){
    }
    
  }
  
    score += 0.1;
    
    fill(0, 102, 153);
    text("Score: "+(int)score, 10, 40);
    textSize(25);
}

void drawPlayer(){
 stroke(204, 132, 0);
 strokeWeight(4);
 fill(204,102, 0);
 
 rect(playerXCor, playerYCor, playerWidth, playerHeight, 7);
}


void mouseDragged(){
 if(mouseX >= 0 && mouseX <= width - playerWidth + 1){
   playerXCor = mouseX;
}
if(mouseY >= 590 && mouseY <= height - playerHeight){

}

}
