// Interactive visual with MAX

// Import libraries
import netP5.*;
import oscP5.*;

// Create empty arrays of circles' initial size, posX, posY and color
float [ ] sizeArray = {};
float [] posXArray = {};
float [] posYArray = {};
color [] colorArray = {};

// Min and max size of circle
float size_lb;
float size_ub;

// Range of circle's moving speed
float moving_speed;

// Frequency of the arpeggiator, in terms of the metro's interval
int arp_freq;

// Upper and lower bound of red color
float color_r_ub;
float color_r_lb;

// Distance between the mouse position and the center of window
float central_dist;

// Dry/wet ratio of reverb effect
float reverb_wet;

// Alpha value of the background
float bg_alpha = 50;


// Declare variables to send OSC messages
OscP5 oscP5;
NetAddress remoteAddress;

void setup() {
  size(700, 700);
  background(255);
  
  // Calculate min and max value of cirlces according to winode size
  size_lb = 40. * height / 900.;
  size_ub = 160. * height / 900.;
  
  // Open port for Processing to receive messages
  oscP5 = new OscP5(this, 9200);
  
  // Set remote address to send messages to
  remoteAddress = new NetAddress("127.0.0.1", 9100);
}

void draw () {
  noStroke();
  
  // White transparent background to show fading traces
  fill(255, bg_alpha);
  rect(0, 0, width, height);
  
  central_dist = dist(mouseX, mouseY, width/2, height/2);
  
  if (mousePressed) {
    // Create circles as mouse is pressed
    posXArray = append(posXArray, mouseX);
    posYArray = append(posYArray, mouseY);
    sizeArray = append(sizeArray, random(size_lb, size_ub));
    
    // Calculate the range of red color value based on mouseX
    color_r_ub = map(abs(mouseX - width/2), width/2, 0, 30, 255);
    color_r_lb = map(abs(mouseX - width/2), width/2, 0, 0, 225);
    
    colorArray = append(colorArray, color(random(color_r_lb, color_r_ub), 30, 200));
    
    // Construct and send the cutoff frequency message
    OscMessage cutoff_freq_message = new OscMessage("/cutoff_freq");
    cutoff_freq_message.add(map(abs(mouseX - width/2), width/2, 0, 8, 14));
    
    oscP5.send(cutoff_freq_message, remoteAddress); 

    // Construct and send the arpeggiator frequency message
    OscMessage arp_freq_message = new OscMessage("/arp_freq");
    arp_freq_message.add(map(central_dist, height/2 * sqrt(2), 0, 500, 60));
    
    oscP5.send(arp_freq_message, remoteAddress); 
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
      
      // Calculate the moving speed based on the distance between mouse position and center of window
      moving_speed = map(central_dist, height/2 * sqrt(2), 0, 0, 30);
      
      // Apply noisy movement to the circle
      posXArray[i] = posXArray[i] + map(noise(millis()/1000., 70), 0, 1, -moving_speed, moving_speed);
      posYArray[i] = posYArray[i] + map(noise(millis()/1000., 40), 0, 1, -moving_speed, moving_speed);
      
      ellipse(posXArray[i], posYArray[i], sizeArray[i], sizeArray[i]);
      
      // Decrease the size of the circle also in a noisy manner
      sizeArray[i] = sizeArray[i] - noise(millis()/10000., 30)*8;
    }
  }
}


void mousePressed(){
  // Send a 1 to MAX once the mouse is pressed to turn on the arpeggiator
  OscMessage on_message = new OscMessage("/arp_on");
  on_message.add(1);
  oscP5.send(on_message, remoteAddress);
}

void mouseReleased(){
  // Send a 0 to MAX once the mouse is released to turn off the arpeggiator
  OscMessage on_message = new OscMessage("/arp_on");
  on_message.add(0);
  oscP5.send(on_message, remoteAddress);
}

// Listener
void oscEvent(OscMessage incomingMessage){
  // Convert the dry/wet ratio of the reverb effect to the alpha value of background
  if(incomingMessage.checkAddrPattern("/reverb_wet")){
    reverb_wet = incomingMessage.get(0).floatValue();
    
    bg_alpha = map(reverb_wet, 0.0, 0.5, 120, 0);
  }
}
