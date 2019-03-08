package obedcorp;

import java.math.BigInteger;

/**
 *
 * 2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 * What is the sum of the digits of the number 2^(1000)?
 *
 * @author jmurillo
 *
 */
public class Problem16 {
    public Problem16() {
    }

    public static void main(String[] args) {
        BigInteger bi = new BigInteger("2");
        for (int i = 1; i < 1000; i++)  {
            bi = bi.multiply(new BigInteger("2"));
        }
        String  biString = bi.toString();
        System.out.println(bi);
        long resp = 0;
        for(int i=0; i<biString.length(); i++){
            //System.out.println(biString.toCharArray()[i]);
            resp = resp + Integer.parseInt(biString.toCharArray()[i] + "");
            //System.out.println("resp " + resp);
        }
        System.out.println(resp);
    }
}
