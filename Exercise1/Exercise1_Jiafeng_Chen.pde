/*  
// PAT 204 - Creative Coding for Music – Fall 2021
// Instructor: Zeynep Özcan, PhD <ozcanz@umich.edu>
 
 Exercise 1: Haiku 
 
 Create a sketch that prints out your Haiku poem (https://en.wikipedia.org/wiki/Haiku) 
 in the Processing Console.
 - The poem should be printed out 1 syllable at a time, and there should be 
 a 1-second delay before each new syllable. 
 - The poem should include "Hello, World!" (https://en.wikipedia.org/wiki/%22Hello,_World!%22_program)
 - Each of the three phrases should appear on a new line. For instance, your haiku could look like:
 
   Hello world its me
   Coding under the fruit tree
   Apples inspire me
   
 You should create a String variable for each syllable, meaning that 
 you should have 5 + 7 + 5 = 17 variables in total. You should pass
 these variables to your print functions. Your Haiku should be printed
 out only once (i.e. it musn't loop)!
 
 Please properly comment your code! Even if your sketch doesn't work, 
 it should clearly communicate your thought process.
 
 https://processing.org/reference/
*/

// You may place your global scope variables here. All the functions in your code
// will have access to your global variables. 

// Declare string variables for the Haiku
String syllable_1_1 = "Co";
String syllable_1_2 = "ding";
String syllable_1_3 = "He";
String syllable_1_4 = "llo";
String syllable_1_5 = "World";

String syllable_2_1 = "Gol";
String syllable_2_2 = "den";
String syllable_2_3 = "light";
String syllable_2_4 = "beam";
String syllable_2_5 = "with";
String syllable_2_6 = "green";
String syllable_2_7 = "leaves";

String syllable_3_1 = "Sun";
String syllable_3_2 = "day";
String syllable_3_3 = "li";
String syllable_3_4 = "bra";
String syllable_3_5 = "ry";


void setup() {
  // Your setup code goes here. It gets executed only once when you run your program.
  // A variable placed inside a function will only be recognized within that function,
  // meaning that if you declare a variable here in setup(), your draw() function 
  // won't know what it is. But it will know variable declared globally (i.e. outside
  // of functions). 
  
  // Print out syllable strings one by one, with delays in between each syllable, and space in between each world
  
  // First phrase
  print(syllable_1_1);
  delay(1000);
  print(syllable_1_2);
  print(" ");
  delay(1000);
  
  print(syllable_1_3);
  delay(1000);
  print(syllable_1_4);
  print(" ");
  delay(1000);
  
  // Change line for the last word in a phrase
  println(syllable_1_5);
  delay(1000);
  
  // Second phrase
  print(syllable_2_1);
  delay(1000);
  print(syllable_2_2);
  print(" ");
  delay(1000);
  
  print(syllable_2_3);
  print(" ");
  delay(1000);
  
  print(syllable_2_4);
  print(" ");
  delay(1000);
  
  print(syllable_2_5);
  print(" ");
  delay(1000);
  
  print(syllable_2_6);
  print(" ");
  delay(1000);
  
  println(syllable_2_7);
  delay(1000);
  
  // Third phrase
  print(syllable_3_1);
  delay(1000);
  print(syllable_3_2);
  print(" ");
  delay(1000);
  
  print(syllable_3_3);
  delay(1000);
  print(syllable_3_4);
  delay(1000);
  
  println(syllable_3_5);
}

void draw () {
  // Your processing/drawing code goes here. 
  // It gets repeated each frame during the runtime of your program.
  // Remember that we want your Haiku to print once.
  // Check references for suggestions.
  
  // Since the Haiku mustn't loop, the draw() function is left empty
}

//Feel free to reach out to me via email or on Canvas if you have
//questions about this assignment. 
//Good Luck!
