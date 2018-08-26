/*
  Simple point/dot class.
  A random in-screen point will be created, and it's label
  is based on its position.
*/
class Point {
  float x;
  float y;
  int   label;
  
  Point(){
    x =random(width);
    y =random(height);
    
    // If 'y' greater than 'x', it will be labeled '1'. Else, '-1'.
    label =(y>x)?1:-1;
  }
  
  void show(){
    if(label>0){
      fill(0);
    } else {
      fill(255);
    }
    stroke(0);
    ellipse(x, y, 8, 8);
  }
}
