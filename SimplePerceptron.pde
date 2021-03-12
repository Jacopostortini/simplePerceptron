Perceptron brain;
Point[] points = new Point[100];
int trainingIndex = 0;
void setup() {
  size(800, 800);
  for (int i = 0; i<points.length; i++) {
    points[i] = new Point();
  }
  brain = new Perceptron(3);
}

void draw() {
  background(255);
  
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  stroke(0);
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  
  stroke(0);
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());
  for (Point p : points) {
    p.display();
    float[] i = {p.x, p.y, p.bias};
    if (brain.guess(i)==p.label) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  noStroke();
  ellipse(p.pixelX(), p.pixelY(), 8, 8);
  }
  Point pt = points[trainingIndex];
  float[] i = {pt.x, pt.y, pt.bias};
  brain.train(i, pt.label);

  
  trainingIndex++;
  if (trainingIndex==points.length) {
    trainingIndex = 0;
  }
}
