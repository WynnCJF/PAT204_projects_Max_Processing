/*  
 PAT 204 - Creative Coding for Music – Fall 2021
 Instructor: Zeynep Özcan, PhD <ozcanz@umich.edu>

 
 Exercise 2: Painting Software Design
 
 Design a painting software similar to Microsoft Paint, but simpler. 
 https://en.wikipedia.org/wiki/Microsoft_Paint
 
 For this exercise:
 
- the user should be able to draw onto the canvas, by click-and-dragging the mouse.  
- At the bottom of your canvas, there should be a user interface (UI)
 for modifying the color of your brush, and switching to an eraser. 
 Your color palette, for instance, could consist of differently 
 colored squares placed side by side. 
- The user should be able to press the number keys on their keyboard
 to change the size of their brush or eraser. Bigger the number, bigger
 the brush. 
- There should be at least 3 brush sizes. 
- Your palette should include at least 3 colors.

- after you finish designing your painting software, draw a sketch (e.g your portrait, art movement inspired)
with your tool and include the screenshot of it in your zip file. 
 
 Tip: Start with simple, add features one at a time. 
   
  Remember that the Processing Reference is a great resource:
  https://processing.org/reference/
  
  Feel free to reach out to me via email or on Canvas if you have
  questions about this assignment. 
  
  Have fun!
*/

// Options for brush and eraser size
int size1 = 15;
int size2 = 25;
int size3 = 40;

int brush_size = size2;
int eraser_size = size2;
int border_size = 5;
int ui_rect_size = 30;
int ui_circle_d = 25;

// y coordinate of UI board (white color, not visible)
int ui_border_up = 540;

// y coordinate of rectangular UI components
int ui_row = 560;

// y coordinate of circle UI components
int ui_row_circle = ui_row + ui_rect_size / 2;

// x coordinates of UI components
int eraser_rect_col = 20;
int color1_col = 80;
int color2_col = 115;
int color3_col = 150;
int color4_col = 185;

int size_sign_col1 = 490;
int size_sign_col2 = 520;
int size_sign_col3 = 562;

int text_delta_x = -3;
int text_delta_y = 5;

// colors
color color1 = color(0);
color color2 = color(255, 0, 0);
color color3 = color(0, 0, 255);
color color4 = color(255, 255, 0);

color brush_color = color1;
color eraser_color = color(255);
color border_color = color(255, 51, 153);
color selected_size_color = color(115, 100);

// A flag indicating whether eraser tool is currently selected
boolean use_eraser = false;


void setup() {
  size (600, 600);
  // White background as canvas
  background (255);
}


void draw () {
  // Disenbale stroke
  noStroke();
  
  // Sketch lines according to mouse press and brush/eraser selection
  if (!use_eraser && mousePressed) {
    // Specify color
    fill(brush_color);
    ellipse (mouseX, mouseY, brush_size, brush_size);
  }
  else if (use_eraser && mousePressed) {
    // Color is fixed to white for eraser
    fill(eraser_color);
    ellipse (mouseX, mouseY, eraser_size, eraser_size);
  }
  
  // UI components (display after the drawing since we don't want them to be covered)
  
  // UI board
  fill(255);
  rect(0, ui_border_up, width, height - ui_border_up);
  
  // Eraser
  fill(200, 200, 200);
  if (use_eraser) {
    // Selected
    stroke(border_color);
    strokeWeight(border_size);
    rect(eraser_rect_col, ui_row, ui_rect_size, ui_rect_size);
    noStroke();
  }
  else {
    // Unselected
    rect(eraser_rect_col, ui_row, ui_rect_size, ui_rect_size);
  }
  
  // Brush colors
  
  // Color 1
  fill(color1);
  if (brush_color == color1 && !use_eraser) {
    // Selected
    stroke(border_color);
    strokeWeight(border_size);
    ellipse(color1_col, ui_row_circle, ui_circle_d, ui_circle_d);
    noStroke();
  }
  else {
    // Unselected
    ellipse(color1_col, ui_row_circle, ui_circle_d, ui_circle_d);
  }
  
  // Color 2
  fill(color2);
  if (brush_color == color2 && !use_eraser) {
    // Selected
    stroke(border_color);
    strokeWeight(border_size);
    ellipse(color2_col, ui_row_circle, ui_circle_d, ui_circle_d);
    noStroke();
  }
  else {
    // Unselected
    ellipse(color2_col, ui_row_circle, ui_circle_d, ui_circle_d);
  }
  
  // Color 3
  fill(color3);
  if (brush_color == color3 && !use_eraser) {
    // Selected
    stroke(border_color);
    strokeWeight(border_size);
    ellipse(color3_col, ui_row_circle, ui_circle_d, ui_circle_d);
    noStroke();
  }
  else {
    // Unselected
    ellipse(color3_col, ui_row_circle, ui_circle_d, ui_circle_d);
  }
  
  // Color 4
  fill(color4);
  if (brush_color == color4 && !use_eraser) {
    // Selected
    stroke(border_color);
    strokeWeight(border_size);
    ellipse(color4_col, ui_row_circle, ui_circle_d, ui_circle_d);
    noStroke();
  }
  else {
    // Unselected
    ellipse(color4_col, ui_row_circle, ui_circle_d, ui_circle_d);
  }
  
  // Size indicator
  stroke(0);
  strokeWeight(2);
  
  // Sketch three circles indicating three different size of brush or eraser
  fill(255);
  ellipse(size_sign_col1, ui_row_circle, size1, size1);
  ellipse(size_sign_col2, ui_row_circle, size2, size2);
  ellipse(size_sign_col3, ui_row_circle, size3, size3);
  
  // Depending on whether a brush or eraser is currently used, highlight the applied size
  fill(selected_size_color);
  if (!use_eraser) {
    if (brush_size == size1) {
      ellipse(size_sign_col1, ui_row_circle, size1, size1);
    }
    else if (brush_size == size2) {
      ellipse(size_sign_col2, ui_row_circle, size2, size2);
    }
    else {
      ellipse(size_sign_col3, ui_row_circle, size3, size3);
    }
  }
  else {
    if (eraser_size == size1) {
      ellipse(size_sign_col1, ui_row_circle, size1, size1);
    }
    else if (eraser_size == size2) {
      ellipse(size_sign_col2, ui_row_circle, size2, size2);
    }
    else {
      ellipse(size_sign_col3, ui_row_circle, size3, size3);
    }
  }
  
  // Fill numbers into the circles, indicating which key to press in order to change size
  fill(0);
  text("1", size_sign_col1 + text_delta_x, ui_row_circle + text_delta_y);
  text("2", size_sign_col2 + text_delta_x, ui_row_circle + text_delta_y);
  text("3", size_sign_col3 + text_delta_x, ui_row_circle + text_delta_y);
}

// Calculate the Euclidean disance between two points (x1, y1) and (x2, y2)
float distance(int x1, int y1, int x2, int y2) {
  return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}

// Change flags according to mouse clicks on the UI components
void mouseClicked() {
  // Eraser selection
  if (mouseX >= eraser_rect_col && mouseX <= eraser_rect_col + ui_rect_size
  && mouseY >= ui_row && mouseY <= ui_row + ui_rect_size) {
    use_eraser = true;
  }
  
  // Color 1 selection
  if (distance(mouseX, mouseY, color1_col, ui_row_circle) <= float(ui_circle_d / 2)) {
    use_eraser = false;
    brush_color = color1;
  }
  
  // Color 2 selection
  else if (distance(mouseX, mouseY, color2_col, ui_row_circle) <= float(ui_circle_d / 2)) {
    use_eraser = false;
    brush_color = color2;
  }
  
  // Color 3 selection
  else if (distance(mouseX, mouseY, color3_col, ui_row_circle) <= float(ui_circle_d / 2)) {
    use_eraser = false;
    brush_color = color3;
  }
  
  // Color 4 selection
  else if (distance(mouseX, mouseY, color4_col, ui_row_circle) <= float(ui_circle_d / 2)) {
    use_eraser = false;
    brush_color = color4;
  }
}

// Change the size of brush or eraser according to key press
void keyPressed() {
  // Change brush or eraser size depending on the key pressed
  if (key == '1') {
    if (!use_eraser) {
      brush_size = size1;
    }
    else {
      eraser_size = size1;
    }
  }
  else if (key == '2') {
    if (!use_eraser) {
      brush_size = size2;
    }
    else {
      eraser_size = size2;
    }
  }
  else if (key == '3') {
    if (!use_eraser) {
      brush_size = size3;
    }
    else {
      eraser_size = size3;
    }
  }
}
