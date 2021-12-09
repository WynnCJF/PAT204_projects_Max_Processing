// Import libraries
import netP5.*;
import oscP5.*;

// Declare variables to send OSC messages
OscP5 oscP5;
NetAddress remoteAddress;

// Global variables

// Control and anchor points for bezier
float bezier_x1;
float bezier_y1;
float bezier_x2;
float bezier_y2;
float bezier_x3;
float bezier_y3;
float bezier_x4;
float bezier_y4;

// Amplitude of oscillation for the four bezier points
float bezier_A1 = 200;
float bezier_A2 = 200;
float bezier_A3 = 200;
float bezier_A4 = 200;

// Position and width of the first rectangle
float rect1_x;
float rect1_x2;
float rect1_width;

// Position and width of the second rectangle
float rect2_x;
float rect2_x2;
float rect2_width;

// Width and center of the overlapping section of the two rectangles
float overlap_width;
float overlap_center;

// Volume of the granular synth
float granular_vol;

// Angle for sinusoid function
float angle;

void setup(){
  background(60, 0, 255);
  size(1300, 700);
  
  // Open port for Processing to receive messages
  oscP5 = new OscP5(this, 9200);
  
  // Set remote address to send messages to
  remoteAddress = new NetAddress("127.0.0.1", 9100);
  
  // Construct and send the noise start message. The message is only sent once when the program starts
  OscMessage noise_start_message = new OscMessage("/noise_start");
  noise_start_message.add(1.0);
  
  oscP5.send(noise_start_message, remoteAddress); 
}

void draw(){
  background(60, 0, 255);
  
  // Use noise to randomly determine the position and width of the first rectangle
  rect1_x = map(noise(millis()/10000., 50), 0, 1, 0, width);
  rect1_width = map(noise(millis()/10000., 10), 0, 1, 0, 800);
  
  fill(72,61,139, 150);
  noStroke();
  
  // Draw the first rectangle before the bezier and circles
  rect(rect1_x, 0, rect1_width, height);

  // Fix the x coordinates of the bezier points, and determine the y coordinates based on sin function
  // The phase difference is PI / 3
  bezier_x1 = -10;
  bezier_y1 = height / 2 + sin(angle) * bezier_A1;
  
  bezier_x2 = 433;
  bezier_y2 = height / 2 + sin(angle + PI / 3) * bezier_A2;
  
  bezier_x3 = 866;
  bezier_y3 = height / 2 + sin(angle + PI * 2 / 3) * bezier_A3;
  
  bezier_x4 = width + 10;
  bezier_y4 = height / 2 + sin(angle + PI) * bezier_A4;
    
  fill(0);
  
  // Draw the bezier with black filling
  bezier(bezier_x1, bezier_y1, bezier_x2, bezier_y2, bezier_x3, bezier_y3, bezier_x4, bezier_y4);
  
  fill(255);
  
  // Draw the four white cirlces. They share the same y coordinates as the four bezier points
  circle(200, bezier_y1, 150);
  circle(500, bezier_y2, 150);
  circle(800, bezier_y3, 150);
  circle(1100, bezier_y4, 150);
  
  // Construct and send the resonant filter central frequency message
  // The central frequency is controlled by the current angle (phase)
  OscMessage bandpass_freq_message = new OscMessage("/filter_freq");
  bandpass_freq_message.add(map(sin(angle), -1, 1, 100, 300));
  
  oscP5.send(bandpass_freq_message, remoteAddress); 
  
  // Construct and send the noise panning message
  // The panning is also controlled by the current angle (phase)
  OscMessage noise_pan_message = new OscMessage("/noise_pan");
  noise_pan_message.add(map(sin(angle), -1, 1, 0, 127));
  
  oscP5.send(noise_pan_message, remoteAddress); 
  
  // Increment the angle
  angle += PI / 180.;
  
  // Use noise to randomly determine the position and width of the second rectangle
  rect2_x = map(noise(millis()/10000., 80), 0, 1, 0, width);
  rect2_width = map(noise(millis()/10000., 30), 0, 1, 0, 800);
  
  fill(102,205,170, 150);
  noStroke();
  
  // Draw the first rectangle after the bezier and circles
  rect(rect2_x, 0, rect2_width, height);
  
  rect1_x2 = rect1_x + rect1_width;
  rect2_x2 = rect2_x + rect2_width;
  
  fill(0);
  overlap_width = 0.0;
  
  // Calculate the width and center positon of the overlapping section, conditioned on the 
  // relative position of the two rectangles. Then draw a black rectangle at the overlapping section
  if (rect1_x2 > rect2_x && rect1_x < rect2_x) {
    overlap_width = min(rect1_x2 - rect2_x, rect2_x2 - rect2_x);
    overlap_center = rect2_x + overlap_width / 2.; 
    rect(rect2_x, 0, overlap_width, height);
  }
  else if (rect1_x > rect2_x && rect1_x < rect2_x2) {
    overlap_width = min(rect1_x2 - rect1_x, rect2_x2 - rect1_x);
    overlap_center = rect1_x + overlap_width / 2.; 
    rect(rect1_x, 0, overlap_width, height);
  }
  
  // Construct and send the granular period message
  // The period is controlled by the width of overlapping section
  OscMessage granular_period_message = new OscMessage("/granular_period");
  granular_period_message.add(map(overlap_width, 0, 400, 120, 15));
  
  oscP5.send(granular_period_message, remoteAddress); 
  
  // Construct and send the granular volumn message
  // The volume is also controlled by the width of overlapping section
  OscMessage granular_vol_message = new OscMessage("/granular_vol");
  granular_vol = map(overlap_width, 0, 100, 0.0, 1.0);
  
  // Ensure that the value doesn't go beyond 1.0
  if (granular_vol > 1.0) {
    granular_vol = 1.0;
  }
  granular_vol_message.add(granular_vol);
  
  oscP5.send(granular_vol_message, remoteAddress); 
  
  // Construct and send the granular panning message
  // The panning is controlled by the center position of the overlapping section
  OscMessage granular_pan_message = new OscMessage("/granular_pan");
  
  granular_pan_message.add(map(overlap_center, 0, width, 0, 127));
  
  oscP5.send(granular_pan_message, remoteAddress); 
}
