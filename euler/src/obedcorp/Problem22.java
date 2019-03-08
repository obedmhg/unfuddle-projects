package obedcorp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 
    Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
	
	For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
	
	What is the total of all the name scores in the file?

 * @author jmurillo
 *
 */
public class Problem22 {
    private static final String NAMES_FILE = "C:\\_apps\\ProjectEuler\\EulerProject\\src\\obedcorp\\extraFiles\\names.txt";
    
    public Problem22() {
    }

    public static void main(String[] args) {
        Problem22 problem22 = new Problem22();
        readFile();
    }
    
    public static void readFile(){
        try {
            long resp = 0;
            
            List <String> names = new ArrayList();
            BufferedReader reader= new BufferedReader(new FileReader(NAMES_FILE));
            String fileLine = reader.readLine(); 
            for(String s: fileLine.split(",")){
                names.add(s.replace("\"", ""));
            }
            Collections.sort(names);
            for(int i=0; i< names.size(); i++){
                String s = names.get(i);
                resp = resp + scoreName(i+1, s);
            }
            System.out.println("The sum of all scores is = " + resp);
  
        }
        
        
        catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static int scoreName(int pos, String name){
        
        char [] chars = name.toCharArray();
        int numberValue = 0;
        int score = 0;       
        
        for(int i=0; i<chars.length; i++){
            switch(chars[i]){
                case 'A' : numberValue += 1; break;
                case 'B' : numberValue += 2; break;
                case 'C' : numberValue += 3; break;
                case 'D' : numberValue += 4; break;
                case 'E' : numberValue += 5; break;
                case 'F' : numberValue += 6; break;
                case 'G' : numberValue += 7; break;
                case 'H' : numberValue += 8; break;
                case 'I' : numberValue += 9; break;
                case 'J' : numberValue += 10; break;
                case 'K' : numberValue += 11; break;
                case 'L' : numberValue += 12; break;
                case 'M' : numberValue += 13; break;
                case 'N' : numberValue += 14; break;
                case 'O' : numberValue += 15; break;
                case 'P' : numberValue += 16; break;
                case 'Q' : numberValue += 17; break;
                case 'R' : numberValue += 18; break;
                case 'S' : numberValue += 19; break;
                case 'T' : numberValue += 20; break;
                case 'U' : numberValue += 21; break;
                case 'V' : numberValue += 22; break;
                case 'W' : numberValue += 23; break;
                case 'X' : numberValue += 24; break;
                case 'Y' : numberValue += 25; break;
                case 'Z' : numberValue += 26; break;
            }
        }
        score = pos * numberValue;
        return score;
    }
    
}
