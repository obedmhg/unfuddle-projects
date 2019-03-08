package obedcorp;

import java.math.BigInteger;

/**
 *
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * Find the sum of the digits in the number 100!
 *
 * @author jmurillo
 *
 */
public class Problem20 {
    public Problem20() {
    }

    public static void main(String[] args) {
        Problem20 problem20 = new Problem20();
        BigInteger b = getFactorial(100);
        System.out.println(b);
        char[] numbers = b.toString().toCharArray();
        long resp = 0;
        for(int i=0; i<numbers.length; i++){
            resp =  resp + Integer.parseInt("" + numbers[i]);
        }
        System.out.println("Resultado = " + resp);
    }


    public static BigInteger getFactorial(int n){
        BigInteger resp = new BigInteger("1");
        for(int i=1; i<=n; i++){
            resp = resp.multiply(new BigInteger(""+i));
        }
        return resp;
    }
}
