import net.fladdict.oscillator.*;



boolean state = false;

Oscillator n1;
Oscillator y1;
Oscillator c1;
Oscillator r1;

String[][] letters;

int totalPixels = 0;

ArrayList<Letter> lettersList;

void setup() {
  size(800,600);
  frameRate(30);
  
  n1 = new OscSin(128,100,128, 0);
  y1 = new OscSin(128,100,128, 1);
  c1 = new OscSin(128,100,128, 2);
  r1 = new OscSin(128,100,128, 3);
  
  
  //pixels = new ArrayList<Pixel>();
  lettersList = new ArrayList<Letter>();
  
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
    lettersList.add(new Letter(letter*10 + letter*1, 0));
    ArrayList<Pixel> pixels = new ArrayList<Pixel>();
    
    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 10; x++) {
        String row = letters[letter][y];
        if (row.charAt(x) == '1') {
          //pixels.add(new Pixel((letter*10) + letter*1 + x, y));
          pixels.add(new Pixel(x, y));
          totalPixels += 1;
        }
      }
    }
    
    lettersList.get(letter).addPixels(pixels);
  }
  
//  for (int letter = 2; letter < 4; letter++) {
//    for (int y = 0; y < 8; y++) {
//      for (int x = 0; x < 10; x++) {
//        String row = letters[letter][y];
//        if (row.charAt(x) == '1') {
//          pixels.add(new Pixel(((letter - 2)*10) + (letter - 2)*1 + x, y + 9));
//          totalPixels += 1;
//        }
//      }
//    } 
//  }
  
  
  println(totalPixels);
}

void draw() {
  
  background(0);
  scale(3);
  for (int x=0; x < lettersList.size(); x++) {
    lettersList.get(x).draw();
  }
  

  
//  for (int x=0; x< pixels.size(); x++) {
//    
//      
//      pixels.get(x).update(color(n1.getValue(),0,0), color(osc1.getValue(),0,0), color(255,255,255)); 
//    
//    
//  }
  
 
}
}
