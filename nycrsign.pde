import net.fladdict.oscillator.*;



boolean state = false;

Oscillator osc;
Oscillator osc1;
Oscillator osc2;
Oscillator osc3;




ArrayList<Pixel> pixels;

void setup() {
  size(800,600);
  frameRate(30);
  
  pixels = new ArrayList<Pixel>();
  
  pixels.add(new Pixel(0,0));
  pixels.add(new Pixel(0,1));
  pixels.add(new Pixel(0,2));
  pixels.add(new Pixel(0,3));
  pixels.add(new Pixel(0,4));
  
  pixels.add(new Pixel(1,1));
  pixels.add(new Pixel(2,2));
  pixels.add(new Pixel(3,3));
  
  pixels.add(new Pixel(4,4));
  pixels.add(new Pixel(4,3));
  pixels.add(new Pixel(4,2));
  pixels.add(new Pixel(4,1));
  pixels.add(new Pixel(4,0));
  
  osc = new OscSin(128,100,128);
  osc1 = new OscSin(128,-100,128);
  osc2 = new OscWhiteNoise(100);
  osc3 = new OscSawTooth(100,100);
  
}

void draw() {
  
  background(0);
  scale(3);
  for (int x=0; x < pixels.size(); x++) {
    pixels.get(x).draw(); 
  }
  

  
  for (int x=0; x< pixels.size(); x++) {
    
      
      pixels.get(x).update(color(osc.getValue(),0,0), color(osc1.getValue(),0,0)); 
    
    
  }
  
  osc.update();
  osc1.update();
  osc2.update();
  osc3.update();
  
  if (osc3.getValue() % 4 == 0) {
  
  osc.setPeriod(osc2.getValue());
  osc1.setPeriod(-osc2.getValue());
  println(osc.getValue());
  }
}
