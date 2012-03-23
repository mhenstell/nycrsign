import net.fladdict.oscillator.*;



boolean state = false;

Oscillator osc;
Oscillator osc1;
Oscillator osc2;
Oscillator osc3;

String[][] letters;

int totalPixels = 0;

ArrayList<Pixel> pixels;

void setup() {
  size(800,600);
  frameRate(30);
  
  osc = new OscSin(128,100,128);
  osc1 = new OscSin(128,-100,128);
  osc2 = new OscWhiteNoise(100);
  osc3 = new OscSawTooth(100,100);
  
  pixels = new ArrayList<Pixel>();
  
  letters = new String[4][8];
  letters[0][0] = "1110000011";
  letters[0][1] = "1111000011";
  letters[0][2] = "1111100011";
  letters[0][3] = "1101110011";
  letters[0][4] = "1100111011";
  letters[0][5] = "1100011111";
  letters[0][6] = "1100001111";
  letters[0][7] = "1100000111";

  letters[1][0] = "1100000011";
  letters[1][1] = "1100000011";
  letters[1][2] = "1100000011";
  letters[1][3] = "1111111111";
  letters[1][4] = "0111111111";
  letters[1][5] = "0000000011";
  letters[1][6] = "0111111111";
  letters[1][7] = "0011111110";
  
  letters[2][0] = "0111111111";
  letters[2][1] = "1111111111";
  letters[2][2] = "1100000000";
  letters[2][3] = "1100000000";
  letters[2][4] = "1100000000";
  letters[2][5] = "1100000000";
  letters[2][6] = "1111111111";
  letters[2][7] = "0111111111";
  
  letters[3][0] = "1111111110";
  letters[3][1] = "1111111111";
  letters[3][2] = "1100000011";
  letters[3][3] = "1100000011";
  letters[3][4] = "1111111110";
  letters[3][5] = "1111111110";
  letters[3][6] = "1100000111";
  letters[3][7] = "1100000011";
  
  for (int letter = 0; letter < 2; letter++) {
    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 10; x++) {
        String row = letters[letter][y];
        if (row.charAt(x) == '1') {
          pixels.add(new Pixel((letter*10) + letter*1 + x, y));
          totalPixels += 1;
        }
      }
    } 
  }
  
  for (int letter = 2; letter < 4; letter++) {
    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 10; x++) {
        String row = letters[letter][y];
        if (row.charAt(x) == '1') {
          pixels.add(new Pixel(((letter - 2)*10) + (letter - 2)*1 + x, y + 9));
          totalPixels += 1;
        }
      }
    } 
  }
  
  
  println(totalPixels);
}

void draw() {
  
  background(0);
  scale(3);
  for (int x=0; x < pixels.size(); x++) {
    pixels.get(x).draw(); 
  }
  

  
  for (int x=0; x< pixels.size(); x++) {
    
      
      pixels.get(x).update(color(osc.getValue(),0,0), color(osc1.getValue(),0,0), color(255,255,255)); 
    
    
  }
  
  osc.update();
  osc1.update();
  osc2.update();
  osc3.update();
  
  if (osc3.getValue() % 4 == 0) {
  
  osc.setPeriod(osc2.getValue());
  osc1.setPeriod(-osc2.getValue());
  }
}
