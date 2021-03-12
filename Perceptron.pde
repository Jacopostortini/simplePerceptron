int sign(float n) {
  if (n>=0) {
    return 1;
  } else {
    return -1;
  }
}

class Perceptron{
  float[] weights;
  float lr = 0.005;
  
  Perceptron(int n){
    weights= new float[n];
    for(int i = 0; i<weights.length; i++){
      weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] input){
    float sum=0;
    for(int i = 0; i<weights.length; i++){
      sum += weights[i]*input[i];
    }
    return sign(sum);
  }
  
  void train(float[] input, int target){
    int guess = guess(input);
    int error = target - guess;
    for (int i = 0; i<weights.length; i++){
      weights[i]  += error*input[i]*lr;
    }
  }
  
  float guessY(float x){
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return -w2/w1-x*w0/w1;
  }
}
