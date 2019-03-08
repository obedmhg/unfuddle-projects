package obedcorp;

/**
 *
 *	The sum of the squares of the first ten natural numbers is,
 *	1pow(2) + 2pow(2) + ... + 10pow(2) = 385
 *	The square of the sum of the first ten natural numbers is,
 *	(1 + 2 + ... + 10)pow(2) = 55pow(2) = 3025
 *
 *	Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
 *
 *	Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 * @author jmurillo
 *
 */
public class Problem6 {
    public Problem6() {
    }

    public static void main(String[] args) {
        long difference = getSqOfSums(100) - getSumOfSq(100);
        System.out.println("difference = " + difference);

    }

    public static long getSumOfSq(int number){
        long resp = 0;
        for(int i = 1; i<= number; i++){
            resp =  resp + (i*i);
        }
        System.out.println("SumOfSq = " + resp);
        return resp;
    }

    public static long getSqOfSums(int number){
        long resp = 0;
        for(int i = 1; i<= number; i++){
            resp =  resp + (i);
        }
        resp = resp * resp;
        System.out.println("SqOfSums = " + resp);
        return resp;

    }

}
