package obedcorp;

import java.math.BigInteger;

/**
 *
 * Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

	21 22 23 24 25
	20  7  8  9 10
	19  6  1  2 11
	18  5  4  3 12
	17 16 15 14 13

	It can be verified that the sum of the numbers on the diagonals is 101.

	What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

 *
 * @author jmurillo
 *
 */
public class Problem28 {
    public Problem28() {
    }

    public static void main(String[] args) {
        long [] number = {1};
        int size = 1;
        long lastNumber = 1;
        int cont = 2;
        BigInteger bi = new BigInteger("1");
        for(int i=1; i< 1000; i++){
            number = new long[4];
            if(i!=1){
                size = size + 2;
                for(int j=0; j<4; j++){
                    number [j] = lastNumber + size-1;
                    lastNumber = number [j];
                    bi = bi.add(new BigInteger(""+lastNumber));
                    System.out.println(lastNumber);
                }
            }
            System.out.println("Level = "+ cont);
            cont ++;
            if(size==1001){
                break;
            }
        }
        System.out.println(bi);
    }
}
