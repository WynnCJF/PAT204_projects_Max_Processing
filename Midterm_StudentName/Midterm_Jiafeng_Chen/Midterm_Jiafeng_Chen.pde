// PAT 204: Creative Coding for Music – Fall 2021
// Instructor: Zeynep Özcan, PhD <ozcanz@umich.edu>

// Midterm Assignment

//Please read Discussion 4: Midterm Project Proposal Discussion one more time for instructions.

/*You should utilize the core concepts of programming 
 that we have been discussing over the past 5 weeks, 
 including but not limited to: conditional statements, 
 loops, arrays, interaction, and object orientation. You 
 can use 2D and 3D graphics, lights, cameras, text, keyboard 
 and mouse input; but feel free to integrate other components 
 and libraries if you feel they are necessary.*/

// As always, comment your projects thoroughly. 

/* Additionally, you are expected to write a block comment 
at the top of your main sketch, addressing the following items:
A brief description of your project (similar to what you provided in your discussion response).
How did your project evolve during its implementation?
What were some of the challenges you encountered while working on this project?
What are the main strengths of your project and how do you think it could be improved?
You can use these informations in your presentation on Monday (October 4).*/

// Keep in mind that the Processing reference at 
// https://processing.org/reference/ is a valuable resource, 
// and that you can email me with your questions at
// <ozcanz@umich.edu>.

// Looking forward to seeing your creative coding works!

/*
My project aims to create real-time visualization of a given song based on its audio file. It consists of 
three main components:
a random white line movement in the middle of the window;
an inner ring responding to the low frequency components of the audio (typically kick drum);
an outer ring responding to the mid frequency components of the audio;
The music would be played as normal simultaneously when the visualization works. The two rings would flicker 
according to the detected "intensity" of the audio's corresponding frequency range, and similarly, the range 
of the center white line's random movement is driven the same way as the inner ring.
When the program is running, the user can move the mouse around to change the color of the inner ring. Also
the user can press and hold the space bar to "freeze" the visualization, creating various visual effects. 
Releasing the space bar would "unfreeze" the visualization.
The projects started with drawing a large circle composed of many small ellipses using sin and cos functions, 
and evolved based on that. One big challenge for me is to figure out how to make the shapes respond to the beats
effectively, and I got inspired by a surprisingly easy online project (https://pastebin.com/JtAn1mV5) which 
doesn't use beat tracking functions and directly uses the amplitude of each sample to comtrol the size of shapes. 
I then chose to use FFT and calcAvg function to calculate the average amplitude over certain range to drive the 
change of my shapes. 
I did quite a lot of adjustments and tunings to the size and shape, as well as the number of components of the 
visualization. Though I used to apply more components than the current final version (such as one part for high frequency range),
I decided to remove them to avoid abundance. Hence I believe one strength of this project is the balance between 
simplicity and variety of the visualization, as each of the three components functions well and is very visible.
Yet I think there could be more creative ways for the user to interact with both the music and the visual effects.
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

// Load audio library classes
Minim minim;
AudioPlayer Song;
FFT fft;

// Song name
String song_name = "Inter.mp3";

// Initialize coordinates of white line 
float line_x = 0.0;
float line_y = 0.0;
float next_line_x;
float next_line_y;

float line_weight;

// Buffer size of AudioPlayer
int buffer_size;

// Initialize the low and mid frequency bands
float low_lb = 100;
float low_ub = 200;

float mid_lb = 1000;
float med_ub = 2000;

// The shape size of low frequency components
float low_inner;
float low_outer;

float med_inner;
float med_outer;

float ring_weight;

float rotate_angle = 0;

// Initialize the alpha value of background color
float background_alpha = 50;
 
void setup () {
  fullScreen();
  // size(1440, 900);
  noCursor();
  // smooth();
  background(0);
  // frameRate(24);
  // println(width);
  // println(height);
  
  // Initialize the size of the main shapes according to full screen height
  low_inner = height / 9.;
  low_outer = height / 3.6;
  
  med_inner = height / 3.;
  med_outer = height * 350. / 900.;
  
  line_weight = height / 90.;
  ring_weight = height / 900.;
  
  // Load audio
  minim = new Minim(this);
  Song = minim.loadFile(song_name);  
  
  buffer_size = Song.bufferSize();
  
  // Initialize fft
  fft = new FFT(buffer_size, Song.sampleRate());
  
  // Start playing
  Song.play();
}
 
void draw () {
  // "Unfreeze" the figure after space key is released
  if (background_alpha < 50 && !keyPressed) {
    background_alpha += 5;
  }
  
  // Fill background
  fill(0, background_alpha);  
  noStroke();
  rect(0, 0, width, height);
  
  // Translate to the center of window
  translate(width/2, height/2);
  
  // Conduct FFT for the audio buffer
  fft.forward(Song.mix);
  
  // Calculate the average amplitude of the mid frequency band
  float avg_mid_freq = fft.calcAvg(mid_lb, med_ub);
  
  // Start drawing the outer ring for mid range
  strokeWeight(ring_weight);
  for (int i = 0; i < 360; i++) {
    float x_in = sin(radians(i + rotate_angle)) * med_inner; 
    float y_in = cos(radians(i + rotate_angle)) * med_inner;
    
    float x_out = sin(radians(i + rotate_angle)) * med_outer; 
    float y_out = cos(radians(i + rotate_angle)) * med_outer;
    
    // Set the alpha value of the outer ring according to the amplitude of mid frequency range
    stroke(map(noise(millis() / 1000), 0, 1, 50, 255), map(noise(millis() / 1000), 0, 1, 50, 255), 255, map(avg_mid_freq, 0, 5, 0, 255));
    
    line(x_in, y_in, x_out, y_out);
  }
  
  // Rotate the outer ring
  rotate_angle += 0.05;
  
  noStroke();
  
  // Calculate the average amplitude of the low frequency band
  float avg_low_freq = fft.calcAvg(low_lb, low_ub);
  
  // Start drawing the inner ring
  for (int i = 0; i < 360; i++) {
    // Randomly locate each circle between the range of inner ring
    float circle_r = random(low_inner, low_outer);
    float x = sin(radians(i)) * circle_r; 
    float y = cos(radians(i)) * circle_r;
    
    // The color of the inner ring is dependent on mouse position
    fill (map(mouseX, 0, width, 30, 255), map(mouseY, 0, height, 100, 180) + 75, random(0, 255), 255);
    
    // The size of little circles is dependent on the amplitude of low frequency range
    ellipse(x, y, avg_low_freq / 8 * (height / 900.), avg_low_freq / 8 * (height / 900.));
  }
  
  // Start drawing the randomized white line
  pushMatrix();
  
  stroke(255, 90);
  strokeWeight(line_weight);
  
  // The moving intensity of white line is based on the amplitude of low frequency range, in sync with inner ring
  next_line_x = map(random(0, 1), 0, 1, -5, 5) * avg_low_freq * (height / 900.);
  next_line_y = map(random(0, 1), 0, 1, -5, 5) * avg_low_freq * (height / 900.);
  
  line(line_x, line_y, next_line_x, next_line_y);
  
  line_x = next_line_x;
  line_y = next_line_y;
  
  popMatrix();
}

// "Freeze" the visual when space key is pressed
void keyPressed() {
  if (key == ' ') {
    background_alpha = 0;
  }
}
