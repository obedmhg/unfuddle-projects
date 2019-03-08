package obedcorp;
/**
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 * @author jmurillo
 *
 */

public class Problem3 {
    public Problem3() {
    }
    public static void main(String[] args) {
        long param = new Long("600851475143").longValue();
        long factors[] = getFactors(param);
    }
    public static long[] getFactors(long number) {
        long[] resp = null;
        for (int i = 1; i < 100000; i++) {
            if (isPrime(i)) {
                if ((number % i) == 0)
                    System.out.println(i + " Is prime factor of " + number);
            }
        }
        return resp;
    }
    static boolean isPrime(int n) {
        if (n <= 2)
            return true;
        if (n % 2 == 0)
            return false;
        for (int i = 3, end = (int)Math.sqrt(n); i <= end; i += 2) {
            if (n % i == 0)
                return false;
        }
        return true;
    }
}
