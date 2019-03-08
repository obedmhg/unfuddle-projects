package obedcorp;

/**
 *
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * a^(2) + b^(2) = c^(2)
 *
 * For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 *
 * @author jmurillo
 *
 */
public class Problem9 {
    public Problem9() {
    }

    public static void main(String[] args) {
        int a = 0;
        int b = 0;
        double c = 0;
        for(int i =0; i<500; i++){
            for(int j=0; j<500; j++){
                int resp2 = (i * i) + (j * j);
                double aux = Math.sqrt(new Long(""+resp2).longValue()) + i + j;
                if (aux == 1000){
                    a = i;
                    b = j;
                    c =  Math.sqrt(new Long(""+resp2).longValue());
                    break;
                }
            }
        }

        System.out.println(a);
        System.out.println(b);
        System.out.println(c);

        long resp = (long) (a * b * c);

        System.out.println(resp);

    }
}
