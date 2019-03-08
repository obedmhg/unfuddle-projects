package obedcorp;

import java.util.ArrayList;
import java.util.List;

/**
 * If we list all the natural numbers below 10 that are multiples of 3 or 5,
 * we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 *
 * @author jmurillo
 *
 */

public class Problem1 {
    public Problem1() {
    }

    public static void main(String[] args) {
        List numeros = new ArrayList();
        for(int i=0; i<1000; i++){
            if(((i%3)==0)||((i%5)==0)){
                numeros.add(i);
            }
        }
        Integer resp = new Integer(0);
        for(int i=0; i<numeros.size(); i++){
            int num;
            num =  (Integer)numeros.get(i);
            resp = resp + num;
        }
        System.out.println(resp);
    }
}
