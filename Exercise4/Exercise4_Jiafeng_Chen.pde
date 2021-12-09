/*
 PAT 204 - Creative Coding for Music – Fall 2021
 Instructor: Zeynep Özcan, PhD <ozcan@umich.edu>

Assignment 4: myObject

In this assignmnet, I would like you to create a new class of your own
using the object-oriented design paradigm. You can implement a real-world 
object, like a tree, landscape, a dystopian city, frankenstein? etc. but it can also be more abstract.
You sketch also can be themed based like architecture, music, mandala (i.e radial symmetry), or whatever you are passionate about.
Regardless, your class should define:

- After you are happy with your design take a screenshot of your sketch and include the screenshot of it in your zip file. 
- At least 3 attributes/properties, i.e. variables that define certain 
qualities of your object, like size, color, dimension etc.
- At least 2 behaviors. i.e. functions that your object serves or performs,
like moving, growing, doing a calculation, or even evolving
-Include 3D graphics. It can be part of your class or you can draw them in your
main draw () function.
- optional: include any time-based function (second(), millis(), frameRate() etc.)
- optional: Submit your screenshot to the Processing Community Catalog. 
https://processingfoundation.org/advocacy/community-catalog

When selecting which object to implement, consider what attributes and 
behaviors it might have, and how you would implement those in Processing. 
In a block comment at the top of your code, describe at least two alternative
classes, detailing attributes and behaviors, that you thought about before 
you eventually settled on the one you implemented.

Your main sketch should create an instance (i.e. object, as we did in Car c1;) from your class,
and your draw() function should call upon the behaviors of this object
using the dot operator, as in car.move(). You can also
create an array of objects and create multiple instances using a for loop,
as we did in class, Car[] carArray = new Car[arrayNumber]. 
  
Remember that the Processing Reference is a great resource:
https://processing.org/reference/
  
Feel free to reach out to me via email if you have
questions about this assignment.

Tip!  - Start simple and then build up
*/

/*
1. When trying to add buildings to the surface of the sphere, I initially thought of defining arrays
for the buildings' size, rotation, color, etc. all inside the earth class. But I then chose to 
define a separate class instead for building, and create arrays of its instances within the Earth class.
This made the code much clearer and I did it to the stars as well.
2. When trying to draw the stars, I initially considered creating a Star class as follows: each instance 
is fixed at a certain position in the background, and it would flicker at some certain frequency. This
means that each star instance would have some time-based value to control its own color. Yet I finally chose
the current version of Star class which spins around the earth.
*/

// Create an instance of myEarth
myEarth newEarth = new myEarth(550, new PVector (350, 1000, 10));

// A boolean to indicate day/night time (for background only)
boolean night = false;

void setup(){
  size(700, 700, P3D);
}

void draw(){
  // Draw backgound according to day/night time
  if (night) {
    background(0);
  }
  else {
    background(224, 255, 255);
  }

  noStroke();
  lights(); 

  // Draw everything included in the newEarth instance
  newEarth.drawToScreen();  
}

void mouseReleased() {
  // Switch between day and night time when mouse is clicked
  if (night) {
    night = false;
  }
  else {
    night = true;
  }
  
  newEarth.switchTime();
}
