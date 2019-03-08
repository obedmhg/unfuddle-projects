package obedcorp;

/**
 * A palindromic number reads the same both ways.
 * The largest palindrome made from the product of two 2-digit numbers
 * is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 * @author jmurillo
 *
 */

public class Problem4 {
    public Problem4() {
    }

    public static void main(String[] args) {
        Problem4 problem4 = new Problem4();
        for(int i=100; i<=999; i++){
            for(int j=100; j<=999; j++){
                long mult = i * j;
                if(isPalindromic(mult)){
                    System.out.println(mult);
                }

            }
        }


    }


    public static boolean isPalindromic(long number) {
        String str1 = "" + number;
        String str2 =  invert(str1);
        return str1.equals(str2);

    }

    public static String invert (String s) {
         String temp = "";
         for (int i=s.length()-1; i>=0; i--)
              temp += s.charAt (i);
         return temp;
    }


}
