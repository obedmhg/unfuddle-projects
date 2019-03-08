package obedcorp;

/**
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * Find the sum of all the primes below two million.
 * @author jmurillo
 *
 */
public class Problem10 {
    public Problem10() {
    }

    public static void main(String[] args) {
        long resp = 0;
        for(int i=2; i<2000000; i++){
            if(isPrime(i)){
                resp = resp + i;
            }
        }
        System.out.println(resp);
    }

    static boolean isPrime(int n) {

        if (n <= 2) {
            return true;
        }
        if (n % 2 == 0) {
            return false;
        }
        for (int i = 3, end = (int)Math.sqrt(n); i <= end; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }

        return true;
    }

}
