/////////////////////////////////////////////////////
// Project Title
// By Your Name
// 
// Write a short project description here
//
// Parsons School of Design
// Code 1 - Fall 2017
// http://www.mycoolwebsite.com
// 
// Code References: 
// 1. This is based on this example: //http://studio.processingtogether.com/sp/pad/export/ro.9LZizxKsIAY4F/latest
// 2. Particle System Tutorial: https://www.openprocessing.org/sketch/26072
// 3. Vintage Computer Art Tutorial: https://www.youtube.com/watch?v=LaarVR1AOvs
// 4. Character Jump Example: https://forum.processing.org/two/discussion/5825/help-with-character-jumping-in-my-game
/////////////////////////////////////////////////////

//image variable
PImage raccoonImage;

//ground is where the character will stop when he/she hits the ground
float ground = 400;

//jumpSpeed is the speed of the jump; larger number = faster jump
float jumpSpeed = 3.5;

//jumpHeight is the height at which the character will start moving downwards
float jumpHeight = 200;

//direction changes based on the character's current direction
//this var will only change from -1 to 1
float direction;

//character's current x and y positions
float xPos;
float yPos = ground;
 
void setup() {
  size(500, 500);
  
  //positions the image from the center point
  imageMode(CENTER);
  
  //loads the image
  raccoonImage = loadImage("raccoon.png");
  
  //sets the x position to the middle of the screen
  xPos = width/2;
}
 
void draw() {
  background(120, 0, 100);
  
  //checking to see if the direction doesn't = 0...
  if (direction != 0) {
    //checking to see if the yposition and the direction is less than the jump height
    if ((yPos += direction) < jumpHeight) {
      //if it is, move it up
      //we multiply by -1 to move it upwards because 
      //the higher in the window you go, the lower the number
      direction *= -1;
    //checking to see if yposition goes BELOW the ground
    } else if (yPos > ground) {
      //if it is, we set the direction to 0
      direction = 0;
      //and set the y position to the ground value
      yPos = ground;
    }
  }
  
  //now we draw the actual image using these x and y positions!
  image(raccoonImage, xPos, yPos);
}
 
void keyPressed() {
  if (key == ' ') {
    if (direction == 0) {
      direction = -jumpSpeed;
    }
  }
}