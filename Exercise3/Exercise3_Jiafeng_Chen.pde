/*  
 PAT 204 - Creative Coding for Music – Fall 2021
 Instructor: Zeynep Özcan, PhD <ozcanz@umich.edu>
 
 Exercise 3 : Interactive Sketch Design
 
Design an interactive sketch that relies on iterative processes to
create emergent complexities out of simple forms and rule systems
such as those that are based on conditional statements.

RULES:
 -! Your code must include "one" function or one new trick that you learn from the processing referance page.
 Don't forget to comment about it.
 
 -! Your code must have interaction elements (for example mouseX, mouseY, keyPressed, etc.)
 
 -! After you are happy with your design take a screenshot of your sketch and include the screenshot of it in your zip file. 

 Here is a possible path to follow for this assignment:
 * Start with simple form, like a rectangle or a circle.
 * Apply a simple process (e.g., random changes in movement, color, or shape),
 which you might constrain with conditional statements (e.g. if the movement
 crosses a certain boundary, revert it, change the color, move to oposite direction ,etc.).
 * Apply iteration (e.g., for or while loops) to this simple process
 so that it creates unexpected or emergent new forms and behaviors.
 * try noise() function for organic random changes
 * You can use arrays to multiply this process. It is up to you. Using arrays is optional. 
 * Add user interaction elements that will allow the user to influence
 this process. You could use mouse position or clicks, keyboard input,
 or textual feedback via the console. 
 
  https://processing.org/reference/
  
  Feel free to reach out to me via email or on Canvas if you have
  questions about this assignment. 
*/

// Interactive visual

// Create empty arrays of circles' initial size, posX, posY and color
float [ ] sizeArray = {};
float [] posXArray = {};
float [] posYArray = {};
color [] colorArray = {};

float size_lb;
float size_ub ;

void setup() {
  fullScreen();
  // colorMode(HSB, 255);
  background(255);
  
  size_lb = 40. * height / 900.;
  size_ub = 160. * height / 900.;
}

void draw () {
  noStroke();
  
  // Black transparent background to show fading traces
  fill(0, 20);
  rect(0, 0, width, height);
  
  // Create circles as mouse is pressed
  if (mousePressed) {
    // The append function is a new trick I've learned from the Processing reference page.
    // It adds new element to the end of an array. Here we create a new circle's corresponding
    // position, size and color with some randomization
    posXArray = append(posXArray, mouseX);
    posYArray = append(posYArray, mouseY);
    sizeArray = append(sizeArray, random(size_lb, size_ub));
    colorArray = append(colorArray, color(random(30, 255), random(20, 30), random(40, 255)));
  }
  
  // Draw circles
  for (int i = 0; i < posXArray.length; i++) {
    // Only draw the circles that have positive size, i.e. haven't disappeared
    if (sizeArray[i] > 0) {
      noiseSeed(i);
      
      // Fill the color of the circle, with a noisy decrement for all RGB fields, and a noisy value for alpha
      fill(
      float((colorArray[i] >> 16) & 0xFF) + map(noise(millis()/500., 70), 0, 1, -(colorArray[i] >> 16) & 0xFF, 0), 
      float((colorArray[i] >> 8) & 0xFF) + map(noise(millis()/500., 10), 0, 1, -(colorArray[i] >> 8) & 0xFF, 0), 
      float(colorArray[i] & 0xFF) + map(noise(millis()/500., 30), 0, 1, -(colorArray[i] & 0xFF), 30), 
      map(noise(millis()/500., 60), 0, 1, 100, 150)
      ); 
      
      // Apply noisy movement to the circle
      posXArray[i] = posXArray[i] + map(noise(millis()/1000., 70), 0, 1, -50, 50);
      posYArray[i] = posYArray[i] + map(noise(millis()/1000., 40), 0, 1, -50, 50);
      
      ellipse(posXArray[i], posYArray[i], sizeArray[i], sizeArray[i]);
      
      // Decrease the size of the circle also in a noisy manner
      sizeArray[i] = sizeArray[i] - noise(millis()/10000., 30)*8;
    }
  }
}
