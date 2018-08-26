// Mapping function. If 'n' is greater than 0, return 1. Else, return -1.
int activation(float n){
  return (n>0)?1:-1;
}

/*
  The perceptron class.
  This class will evaluate points coord. So, every
  point has two inputs: x-coord and y-coord.
  
  So, if it has 2 inputs, it has an 2 weights array. 
  'weight[0]' is the weight for 'x' coord patterns.
  'weight[1]' is the weight for 'y' coord patterns.
*/
class Perceptron {
  float[] weight =new float[2];
  
  // Start weight with random values
  Perceptron(){
    for(int i=0; i<weight.length; i++){
      weight[i] =random(-1, 1);
    }
  }
  
  /*
    Evaluation function
    After multiply every input by its weight, and sum its values,
    I must have an formatted output. This output is sended to 
    'activation' function that maps every value to '-1' or '+1' labels.
  */
  int evaluate(float[] input){
    float temp =0;
    for(int i=0; i<weight.length; i++){
      temp +=input[i] *weight[i];
    }
    
    return activation(temp);
  }
  
  /*
    This is the training function.
    It will receive KNOWED VALUES. So, it will evaluate the input.
    If the evaluation is different from the expected (target) value,
    it will backpropagate the error to correct the weights. This correction
    must be smoothed by the 'learningRate', to avoid a big correction that
    can produces new big errors.
  */
  void training(float[] input, int target, float learningRate){
    int guess =evaluate(input);
    int error =target-guess;
    
    for(int i=0; i<weight.length; i++){
      weight[i] += error*input[i]*learningRate;
    }
  }
}
