package obedcorp;

import java.math.BigInteger;

/**
 *
 	The Fibonacci sequence is defined by the recurrence relation:

    F_(n) = F_(n−1) + F_(n−2), where F_(1) = 1 and F_(2) = 1.

Hence the first 12 terms will be:

    F_(1) = 1
    F_(2) = 1
    F_(3) = 2
    F_(4) = 3
    F_(5) = 5
    F_(6) = 8
    F_(7) = 13
    F_(8) = 21
    F_(9) = 34
    F_(10) = 55
    F_(11) = 89
    F_(12) = 144

The 12th term, F_(12), is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?

 * @author jmurillo
 *
 */
public class Problem25 {
    public Problem25() {
    }

    public static void main(String[] args) {
        BigInteger fn_1 = new BigInteger("1");
        BigInteger fn_2 = new BigInteger("1");
        BigInteger aux = null;
        boolean exit = false;
        int f = 3;
        do{
           aux = fn_1;
           fn_1 = getNextNumber(fn_2, fn_1);
           fn_2 = aux;
            if(fn_1.toString().length()==1000 ){
                System.out.println("f("+ f + ") contains 1000 digits ");
                break;
            }
            f++;

        }while(exit!=true);

    }

    public static BigInteger getNextNumber(BigInteger fn_1, BigInteger fn_2){
        BigInteger resp = fn_1.add(fn_2);
        return resp;

    }



}
