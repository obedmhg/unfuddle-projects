package obedcorp;

import java.math.BigInteger;

public class Problem30 {
    public Problem30() {
    }

    public static void main(String[] args) {
        long allNumbers = 0;
        for(int i=10; i< 200000; i++){
            String number = "" + i;
            long sum = 0;
            for(int j=0; j<number.length(); j++){
                BigInteger bi = new BigInteger(""+number.toCharArray()[j]);
                bi = bi.pow(5);
                sum = sum + Integer.parseInt(bi.toString());
            }
            String nCompare = sum + "";
            if(number.equals(nCompare)){
                allNumbers = allNumbers + sum;
                System.out.println(number);
            }
        }
        System.out.println("Finish");
        System.out.println("Total " + (allNumbers - 1) );
    }
}
