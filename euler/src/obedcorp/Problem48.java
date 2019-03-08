package obedcorp;

import java.math.BigInteger;

import java.util.ArrayList;
import java.util.List;

/**
 *
 	The series, 1^(1) + 2^(2) + 3^(3) + ... + 10^(10) = 10405071317.
	Find the last ten digits of the series, 1^(1) + 2^(2) + 3^(3) + ... + 1000^(1000).
 * @author jmurillo
 *
 */
public class Problem48 {
    public Problem48() {
    }

    public static void main(String[] args) {
        BigInteger bi = new BigInteger("0");
        List allNumbers = new ArrayList();
        for(int i=1; i<= 1000; i++){
            BigInteger biCont = new BigInteger(""+i);
            biCont = biCont.pow(i);
            System.out.println(i + "^" +i + "=" + biCont);
            allNumbers.add(biCont);
            bi = bi.add(biCont);
        }
        System.out.println(bi);


    }
}
