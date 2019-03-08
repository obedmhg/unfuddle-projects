package obedcorp;

import java.math.BigDecimal;
import java.math.MathContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

    ^(1)/_(2)	= 	0.5
    ^(1)/_(3)	= 	0.(3)
    ^(1)/_(4)	= 	0.25
    ^(1)/_(5)	= 	0.2
    ^(1)/_(6)	= 	0.1(6)
    ^(1)/_(7)	= 	0.(142857)
    ^(1)/_(8)	= 	0.125
    ^(1)/_(9)	= 	0.(1)
    ^(1)/_(10)	= 	0.1

Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that ^(1)/_(7) has a 6-digit recurring cycle.

Find the value of d < 1000 for which ^(1)/_(d) contains the longest recurring cycle in its decimal fraction part.

 */

public class Problem26 {
    public Problem26() {
    }
    
    public static List data = new ArrayList();

    public static void main(String[] args) {
        start();
    }
    
    public static String makeDivision(int number){
        
        float num = 1/number;
        System.out.println(num);
        
        return "";
        
    }
    
    public static void start(){
        for(int i=1; i< 1000; i++){
            BigDecimal one = new BigDecimal("1.0"); 
            BigDecimal mod = one.divide(new BigDecimal(""+i), 256, BigDecimal.ROUND_HALF_EVEN);
            System.out.println("The mod of 1/" + i + " is "+ mod );
            String param = "" + mod;
            //System.out.println(param);
            
            if(hasRecurrentDigits2(param.substring(2, param.length()))){
                System.out.println("The mod of 1/" + i + " is "+ mod );
            }else{
                //System.out.println(param);
            }
        }
        System.out.println("finish");
        
    }
    
    
    public static boolean hasRecurrentDigits(String number){
        String str =  "" + number;
        if(str.length()>35){
            String str2 = str.substring(0, 32);
            
            if(str.contains(str2+str2.substring(0, 3))){
                System.out.println(str2);
                return true;
            }
        }
        
        return false;
    }
    
    
    public static boolean hasRecurrentDigits2(String number){
        String str =  "" + number;
        if(str.length()>35){
            for(int i=0; i<5; i++){
                for(int j=6; j<32; j++){
                    String str2 = str.substring(i, j);
                    if (str2.length() >= 30) {
                        if(str.contains(str2+str2)){
                            if(!hasRepetedStrings(str2)){
                                System.out.println(str2);
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
    
    public static boolean hasRepetedStrings(String str){
        for(int i=1; i< 15; i++){
            if(str.contains(str.substring(0,i)+ str.substring(0,i))){
                return true;
            }
        }
        return false;
    }    
    
    
    
}
