final int POINT_AMOUNT =800;

int   epoch        =0;
float learningRate =0.1;

Perceptron brain;
Point[] point =new Point[POINT_AMOUNT];

// Render colored squares around points to show perceptron evaluation.
void perceptronEvaluation(){
  for(Point pt : point) {
    float[] input ={pt.x, pt.y};
    int result =brain.evaluate(input);
    
    // Select stroke color: green is right, red is wrong
    if(result==pt.label){
      stroke(0, 255, 0);
    } else {
      stroke(255, 0, 0);
    }
    noFill();
    rect(pt.x -5, pt.y -5, 10, 10);
  }
}
// Just print current epoch and perceptron's weights
void perceptronWeights(){
  println("epoch: "+epoch);
  println("weight: {"+brain.weight[0]+","+brain.weight[1]+"}");
}

void setup(){
  size(700, 700);

  // Instantiate perceptron algorithm
  brain =new Perceptron();
  
  // Create POIN_AMOUNT points
  for(int i=0; i<POINT_AMOUNT; i++){
    point[i] =new Point();
  }
  
  // Print random start values of the perceptron's weights
  perceptronWeights();
}

void mousePressed(){
  // Update perceptron weights sending he knowed data
  epoch++;
  for(Point pt : point) {
    float[] input ={pt.x, pt.y};
    brain.training(input, pt.label, learningRate);
  }
  println("epoch: "+epoch);
  println("weight ={"+brain.weight[0]+","+brain.weight[1]+"}");
  
  // Update perceptron evaluation render
  perceptronEvaluation();
}

void draw() {
  background(255);
  stroke(0);
  line(0, 0, width, height);
 
  //Render all points
  for(Point pt : point) {
    pt.show();
  }
  
  // Render first evaluation
  perceptronEvaluation();
}
