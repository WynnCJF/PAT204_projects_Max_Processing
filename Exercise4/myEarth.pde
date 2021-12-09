// A class defining a building
class Building {
  // Building size
  float h;
  float w;
  float l;

  // Rotation
  float rotate_x;
  float rotate_y;

  // Color
  color building_color;
  color building_color_night;
  color building_color_day;

  Building (int sphere_size) {
    // Initialize the height according to the earth size
    h = random(2 * sphere_size + 80, 2 * sphere_size + 400);
    w = random(40, 70);
    l = random(40, 70);

    rotate_x = random(0, 10);
    rotate_y = random(0, 10);

    building_color_night = color(176 + random(-20, 20), 196 + random(-20, 20), 222 + random(-20, 20));
    
    float color_day = 160 + random(-70, 70);
    building_color_day = color(color_day);
    building_color = building_color_day;
  }
}

// A class defining a star
class Star {
  // Size
  float side_len;

  // Relative position to the earth
  PVector pos;

  // Rotation
  float rotate_x;
  float rotate_y;
  float rotate_z;

  Star () {
    side_len = 10;
    rotate_x = random(0, 10);
    rotate_y = random(0, 10);
    rotate_z = random(0, 10);
    pos = new PVector(1000, 1000, 1000);
  }
}

// A class defining the earth, which contains buildings and stars
class myEarth {
  // A boolean flag that indicates day/night time for an earth instance
  boolean nighttime;

  // Number of buildings and stars
  int array_size = 250;
  int star_array_size = 500;

  // Size of the earth
  int sphere_size;

  // Ground colors
  color color_;
  color ground_color_day;
  color ground_color_night;

  // Position
  PVector position;

  // Arrays of buildings and stars
  Building[] buildingArray = new Building[array_size];
  Star[] starArray = new Star[star_array_size];

  // Initialization
  myEarth(int earth_size, PVector earth_pos) {
    sphere_size = earth_size;
    position = earth_pos;

    nighttime = false;

    ground_color_night = color(0, 0, 80);
    ground_color_day = color(0, 180, 50);
    color_ = ground_color_day;

    for (int i = 0; i < array_size; ++i) {
      buildingArray[i] = new Building(sphere_size);
    }

    for (int i = 0; i < star_array_size; ++i) {
      starArray[i] = new Star();
    }
  }

  // Draw function
  void drawToScreen() {
    pushMatrix();

    // Draw the ground sphere
    fill(color_);
    noStroke();
    translate(position.x, position.y, position.z);
    rotateX(-millis() / 30000.);
    rotateY(mouseX / 500.);
    sphere(sphere_size);

    // Draw the buildings
    for (int i = 0; i < array_size; ++i) {
      pushMatrix();

      rotateX(buildingArray[i].rotate_x);
      rotateY(buildingArray[i].rotate_y);

      fill(buildingArray[i].building_color);

      box(buildingArray[i].w, buildingArray[i].l, buildingArray[i].h);

      popMatrix();
    }

    // Draw the stars at night time
    if (nighttime) {
      fill(255);

      for (int i = 0; i < star_array_size; ++i) {
        pushMatrix();

        rotateX(starArray[i].rotate_x);
        rotateY(starArray[i].rotate_y);
        rotateZ(starArray[i].rotate_z);
        translate(starArray[i].pos.x, starArray[i].pos.y, starArray[i].pos.z);

        box(starArray[i].side_len);

        popMatrix();
      }
    }

    popMatrix();
  }

  // Switch the earth status between day and night time
  void switchTime() {
    if (nighttime) {
      nighttime = false;
      color_ = ground_color_day;
      for (int i = 0; i < array_size; ++i) {
        buildingArray[i].building_color = buildingArray[i].building_color_day;
      }
    }
    else {
      nighttime = true;
      color_ = ground_color_night;
      for (int i = 0; i < array_size; ++i) {
        buildingArray[i].building_color = buildingArray[i].building_color_night;
      }
    }
  }
}
