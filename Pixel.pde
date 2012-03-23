class Pixel {
  int x = 0;
  int y = 0;
  
  float pixelSize = 10;
  float spacing = 1;
  
  color c1 = color(255,0,0);
  color c2 = color(0,255,255);
  color c3 = color(0,0,255);
  Pixel(int x_, int y_) {
    x = x_;
    y = y_; 
  }
  
 void update(int _c1, int _c2, int _c3) {
   
   c1 = _c1;
   c2 = _c2;
   c3 = _c3;
 }

 void draw() {
  
   pushMatrix();
   translate(x * pixelSize + (x * spacing), y * pixelSize + (y * spacing));
   fill(255,255,255, 100);
   rect(0, 0, 10, 10);
  
   noStroke();
   fill(c1);
   ellipse(2,2,1.5,1.5);
   ellipse(pixelSize-2,2,1.5,1.5);
   ellipse(2,pixelSize - 2,1.5,1.5);
   ellipse(pixelSize-2,pixelSize-2,1.5,1.5);
   
   fill(c2);
   ellipse(2,pixelSize/2,1.5,1.5);
   ellipse(pixelSize-2,pixelSize/2,1.5,1.5);
   ellipse(pixelSize/2,pixelSize-2,1.5,1.5);
   ellipse(pixelSize/2,2,1.5,1.5);
   
   fill(c3);
   ellipse(pixelSize/2,pixelSize/2,1.5,1.5);
   
   popMatrix();
 }
}
