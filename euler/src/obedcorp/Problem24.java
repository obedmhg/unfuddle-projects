package obedcorp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
	A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

	012   021   102   120   201   210

	What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
 * @author jmurillo
 *
 */
public class Problem24 {
    public Problem24() {
    }/*
    static List lists = new ArrayList();

    public static void main(String[] args) {
        //        String s = getNextString("012", 2, 2, 0, 0);
        //listsSolution(3);
        p();
    }
*/
    public static void p() {
        int[] factorial = { 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };
        String s = "0123456789";
        int limit = 999999;
        String s1 = "";
        for (int i = factorial.length - 1; i >= 0; i--) {
            int num = limit / factorial[i];
            s1 += s.charAt(num);
            limit = limit - num * factorial[i];
            s = doff(s, num);
        }
        System.out.println(s1 + s);
    }


    private static String doff(String s, int index) {
        return s.substring(0, index) + s.substring(index + 1);
    }

/*
    public static String getNextString(String s, int index, int max, int min,
                                       int start) {
        Integer[] integers = new Integer[s.length()];
        char[] chars = s.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            integers[i] = new Integer("" + chars[i]);
        }
        System.out.println(s);
        String resp = "";

        if ((integers[index] + 1) > max) {
            if (min == start) {
                integers[index] = min + 1;
            }
            index = index - 1;
            if (min == start) {
                integers[index] = integers[index] + 1;
            }
        } else {
            integers[index] = integers[index] + 1;
        }
        for (int i = 0; i < integers.length; i++) {
            resp = resp + integers[i];
        }

        if (index != 0) {
            String str = getNextString(resp, index, max, min, start);
        } else {
            if (start < max) {
                start = start + 1;
                resp = "" + start + (start - 1) + (start + 1);
                String str = getNextString(resp, 2, max, start, start);
            }
        }

        return s;


    }

    public static void listsSolution(int number) {

        for (int i = 0; i < number; i++) {
            lists.add(new ArrayList());
        }
        for (int i = 0; i < lists.size(); i++) {
            List list = (List)lists.get(i);
            for (int j = 0; j < number; j++) {
                list.add(j);
            }
        }

        for (int i = 0; i < lists.size(); i++) {
            List list = (List)lists.get(0);
            for (int j = 0; j < list.size(); j++) {
                System.out.print(list.get(j));
            }

        }


    }

    */
     public static String[] permutations( String digits )
             {
                     String[] result;
                     String[] resultSub;
                     String digitsSub;
                     int n = 1;

                     for( int i=1; i<=digits.length(); i++ )
                     {
                             n *= i;
                     }

                     result = new String[n];

                     if( n == 1 )
                     {
                             result[0] = digits;
                             return result;
                     }

                     for( int i=0; i<digits.length(); i++ )
                     {
                             digitsSub = digits.substring(0,i)+digits.substring(i+1);
                             resultSub = permutations( digitsSub );

                             for( int j=0; j<resultSub.length; j++ )
                             {
                                     result[i*resultSub.length+j] = digits.charAt(i) + resultSub[j];
                             }
                     }

                     return result;
             }

             public static void main(String[] args)
             {
                     //String[] result = permutations("0123456789");
                    p();
                     //System.out.println( result[999999] );
             }


}
