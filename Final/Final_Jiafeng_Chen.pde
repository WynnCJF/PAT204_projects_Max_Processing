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
float bezier_A;

// Size of cirlces
float circle_size;

// Position and width of the first rectangle
float rect1_x;
float rect1_x2;
float rect1_width;

// Position and width of the second rectangle
float rect2_x;
float rect2_x2;
float rect2_width;

// Position and height of the horizontal rectangle
float rect3_y;
float rect3_y2;
float rect3_height;

// Width and center of the overlapping section of the two rectangles
float overlap_width;
float overlap_center;


// Volume of the granular synth
float granular_vol;

// Angle for sinusoid function
float angle;

// i is for generating random event
float i;

// Flag indicating whether a random rectangle is currently on screen
boolean random_rect_exist = false;

// Position and size of a random rectangle
float random_pos_x;
float random_pos_y;
float random_h;
float random_w;

// Parameters for the FM synth
boolean synth_on;
float harmonic_ratio;
float modulation_index;
float synth_vol;

// Alpha for background color
float background_alpha = 255;

// The horizontal variance of the circles' positions
float circle_x_var = 0;

void setup(){
  background(60, 0, 255);
  
  // size(1300, 700);
  fullScreen();
  noCursor();
  
  println(width);
  println(height);
  
  // Set the amplitude of the circles' oscillation
  bezier_A = height * 2. / 9.;
  
  // Set the circle size
  circle_size = width * 0.115;
  
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
  // Background color varies according to angle
  fill(map(sin(angle), -1, 1, 15, 60), 0, map(sin(angle), -1, 1, 200, 255), background_alpha);
  rect(0, 0, width, height);
  
  // Use noise to randomly determine the position and width of the first rectangle
  rect1_x = map(noise(millis()/15000., 50), 0, 1, 0, width);
  rect1_width = map(noise(millis()/15000., 10), 0, 1, 0, width / 3.);
  
  fill(72, 61, 139, 150);
  noStroke();
  
  // Draw the first rectangle before the bezier and circles
  rect(rect1_x, 0, rect1_width, height);

  // Fix the x coordinates of the bezier points, and determine the y coordinates based on sin function
  // The phase difference is PI / 3
  bezier_x1 = -width / 130.;
  bezier_y1 = height / 2 + sin(angle) * bezier_A;
  
  bezier_x2 = width / 3.;
  bezier_y2 = height / 2 + sin(angle + PI / 3) * bezier_A;
  
  bezier_x3 = width * 2. / 3.;
  bezier_y3 = height / 2 + sin(angle + PI * 2 / 3) * bezier_A;
  
  bezier_x4 = width + width / 130.;
  bezier_y4 = height / 2 + sin(angle + PI) * bezier_A;
    
  fill(0);
  
  // Draw the bezier with black filling
  bezier(bezier_x1, bezier_y1, bezier_x2, bezier_y2, bezier_x3, bezier_y3, bezier_x4, bezier_y4);
  
  fill(255);
  
  // Determine the variance of the circles' x coordinates based on background alpha value
  circle_x_var = map(background_alpha, 0, 255, 2., 0.);
  
  // Draw the four white cirlces. They share the same y coordinates as the four bezier points
  circle(width * 2. / 13. + map(random(circle_x_var), 0., 3., -2., 2.), bezier_y1, circle_size);
  circle(width * 5. / 13. + map(random(circle_x_var), 0., 5., -2., 2.), bezier_y2, circle_size);
  circle(width * 8. / 13. + map(random(circle_x_var), 0., 5., -2., 2.), bezier_y3, circle_size);
  circle(width * 11. / 13. + map(random(circle_x_var), 0., 5., -2., 2.), bezier_y4, circle_size);
  
  // Construct and send the resonant filter central frequency message
  // The central frequency is controlled by the current angle (phase)
  OscMessage bandpass_freq_message = new OscMessage("/filter_freq");
  bandpass_freq_message.add(map(sin(angle), -1, 1, 100, 300));
  
  oscP5.send(bandpass_freq_message, remoteAddress); 
  
  // Construct and send the noise panning message
  // The panning is also controlled by the current angle (phase)
  OscMessage noise_pan_message = new OscMessage("/noise_pan");
  
  // Original: normal panning
  // noise_pan_message.add(map(sin(angle), -1, 1, 0, 127));
  // Alternative: panning setting for reversed speaker
  noise_pan_message.add(map(sin(angle), -1, 1, 127, 0));
  
  oscP5.send(noise_pan_message, remoteAddress); 
  
  // Increment the angle
  angle += PI / 180.;
  
  // Use noise to randomly determine the position and width of the second rectangle
  rect2_x = map(noise(millis()/10000., 80), 0, 1, 0, width);
  rect2_width = map(noise(millis()/10000., 30), 0, 1, 0, width / 2.5);
  
  fill(102, 205, 170, 150);
  noStroke();
  
  // Draw the second rectangle after the bezier and circles
  rect(rect2_x, 0, rect2_width, height);
  
  rect1_x2 = rect1_x + rect1_width;
  rect2_x2 = rect2_x + rect2_width;
  
  // Use noise to randomly determine the position and height of the third, horizontal rectangle
  rect3_y = map(noise(millis()/20000., 100), 0, 1, 0, height);
  rect3_height = map(noise(millis()/20000., 150), 0, 1, 0, height / 4.);

  strokeWeight(height * 5. / 900.);
  stroke(255, 150);
  fill(60, 0, 255, 150);
  
  // Draw the thrid, horizontal rectangle
  rect(-width / 144., rect3_y, width + width / 72., rect3_height);
  noStroke();
  
  overlap_width = 0.0;
  
  // Calculate the width and center positon of the overlapping section, conditioned on the 
  // relative position of the two rectangles. Then draw a black rectangle at the overlapping section, 
  // and a red rectangle at the overlapping of all three rectangles
  if (rect1_x2 > rect2_x && rect1_x < rect2_x) {
    overlap_width = min(rect1_x2 - rect2_x, rect2_x2 - rect2_x);
    overlap_center = rect2_x + overlap_width / 2.; 
    
    // Draw the black rectangle
    fill(0);
    rect(rect2_x, 0, overlap_width, height);
    
    // Draw the red rectangle
    fill(map(overlap_width, width / 3., 0, 255, 120), 0, 0);
    rect(rect2_x, rect3_y, overlap_width, rect3_height);
    
    // Set the FM synth parameters, and the background alpha, based on the shape of the red rectangle
    synth_on = true;
    modulation_index = map(rect3_height, height / 4., 0, 0.5, 8);
    harmonic_ratio = map(overlap_width, 0, width / 3., 0.2, 8);
    synth_vol = map(overlap_width, 0, 50, 0, 0.8);
    if (synth_vol > 0.8) {
      synth_vol = 0.8;
    }
    
    background_alpha = map(overlap_width, 0, width / 10., 255, 10);
    background_alpha = max(background_alpha, 20);
  }
  else if (rect1_x > rect2_x && rect1_x < rect2_x2) {
    overlap_width = min(rect1_x2 - rect1_x, rect2_x2 - rect1_x);
    overlap_center = rect1_x + overlap_width / 2.; 
    
    // Draw the black rectangle
    fill(0);
    rect(rect1_x, 0, overlap_width, height);
    
    // Draw the red rectangle
    fill(map(overlap_width, width / 3., 0, 255, 120), 0, 0);
    rect(rect1_x, rect3_y, overlap_width, rect3_height);
    
    // Set the FM synth parameters, and the background alpha, based on the shape of the red rectangle
    synth_on = true;
    modulation_index = map(rect3_height, height / 4., 0, 0.5, 8);
    harmonic_ratio = map(overlap_width, 0, width / 3., 0.2, 8);
    
    synth_vol = map(overlap_width, 0, 50, 0, 0.8);
    if (synth_vol > 0.8) {
      synth_vol = 0.8;
    }
    
    background_alpha = map(overlap_width, 0, width / 10., 255, 10);
    background_alpha = max(background_alpha, 20);
  }
  else {
    synth_on = false;
    circle_x_var = 0;
    background_alpha = 255;
  }
  
  if (synth_on == true) {
    // Construct and send the harmonic ratio message
    // The harmonic ratio is controlled by the width of the overlapping section
    OscMessage harmonic_ratio_message = new OscMessage("/harmonic_ratio");
    harmonic_ratio_message.add(harmonic_ratio);
    
    oscP5.send(harmonic_ratio_message, remoteAddress); 
    
    // Construct and send the synth volume message
    // The synth volume is also controlled by the width of the overlapping section
    OscMessage synth_vol_message = new OscMessage("/synth_vol");
    synth_vol_message.add(synth_vol);
    
    oscP5.send(synth_vol_message, remoteAddress); 
    
    // Construct and send the modulation index message
    // The modulation index is controlled by the height of the overlapping section
    OscMessage modulation_index_message = new OscMessage("/modulation_index");
    modulation_index_message.add(modulation_index);
    
    oscP5.send(modulation_index_message, remoteAddress); 
  }
  
  // Randomly generate i and decide upon whether to draw a random rectangle based on its value
  i = random(10);
  
  if (random_rect_exist == true && i > 0.8) {
    fill(random(0, 255));
    rect(random_pos_x, random_pos_y, random_w, random_h);
    
    // Construct and send the granular volumn message
    // The granular volume is turned on only when this random rectangle is on screen
    OscMessage granular_vol_message = new OscMessage("/granular_vol");
    granular_vol_message.add(1.0);
    
    oscP5.send(granular_vol_message, remoteAddress); 
    
    // Construct and send the granular panning message
    // The panning is controlled by the center position of the random rectangle
    OscMessage granular_pan_message = new OscMessage("/granular_pan");
    
    // Original: normal panning
    // granular_pan_message.add(map(random_pos_x, 0, width - random_w, 0, 127));
    
    // Alternative: panning setting for reversed speaker
    granular_pan_message.add(map(random_pos_x, 0, width - random_w, 127, 0));
    
    oscP5.send(granular_pan_message, remoteAddress); 
  } 
  // The wider the overlapping section, the more likely that a random rectangle would be generated
  else if (random_rect_exist == false && i > map(overlap_width, 0, width / 3., 9.95, 5.)) {
    random_rect_exist = true;
    
    fill(random(0, 255));
    random_w = random(100, 400);
    random_h = random(200, 500);
    random_pos_x = random(0, width - random_w);
    random_pos_y = random(0, height - random_h);
    
    rect(random_pos_x, random_pos_y, random_w, random_h);
  }
  else {
    random_rect_exist = false;
    
    // Construct and send the granular volume message
    // The granular synth is turned off by setting volume to 0 when there is no random rectangle on screen
    OscMessage granular_vol_message = new OscMessage("/granular_vol");
    granular_vol_message.add(0.0);
    
    oscP5.send(granular_vol_message, remoteAddress); 
  }
}
