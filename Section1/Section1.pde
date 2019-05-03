int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    fill(255);
    rect(x, y, 400, 200);

    line(x, y+100, x+400, y+100);

    for(int i = 0; i < values.length; i++) {
      if(values[i] < 0) {
        if(values[i] < -50) {
          fill(255, 0, 0);
        }
        else {
          fill(255, 150, 0);
        }
      }
      else {
        if(values[i] > 50) {
          fill(0, 255, 0);
        }
        else {
          fill(255, 255, 0);
        }
      }
      rect(x+(i * 400/values.length), y+100-values[i], 400/values.length, values[i]);
    }


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      if(values[i] > 100) {
        values[i] = 100;
        speeds[i] *= -1;
      }
      if(values[i] < -100) {
        values[i] = -100;
        speeds[i] *= -1;
      }
      
      values[i] += speeds[i];
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}