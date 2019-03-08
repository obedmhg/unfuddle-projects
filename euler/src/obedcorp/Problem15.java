package obedcorp;

import java.math.BigInteger;

/**
 * Starting in the top left corner of a 2×2 grid, there are 6 routes (without backtracking) to the bottom right corner.
 *
 * Ref: http://projecteuler.net/project/images/p_015.gif
 *
 * How many routes are there through a 20×20 grid?
 *
 * @author jmurillo
 *
 */

public class Problem15 {
    public Problem15() {
    }

    public static void main(String[] args) {
        System.out.println(useFormula(4));
    }

    public static BigInteger getFactorial(int n){
        BigInteger resp = new BigInteger("1");
        for(int i=1; i<=n; i++){
            resp = resp.multiply(new BigInteger(""+i));
        }

        return resp;
    }

    public static BigInteger useFormula(int n){
        BigInteger resp;
        BigInteger a ;
        BigInteger b ;
        a = getFactorial(n*2);
        b = getFactorial(n);
        resp = a.divide(b.multiply(b));
        return resp;

    }

}
