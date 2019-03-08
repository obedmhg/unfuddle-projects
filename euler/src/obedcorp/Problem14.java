package obedcorp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 * Using the rule above and starting with 13, we generate the following sequence:
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 *
 * @author jmurillo
 *
 */
public class Problem14 {

    public static int count = 0;
    public static List longs =  new ArrayList();
    public Problem14() {
    }

    public static void main(String[] args) {
        long aux = 13;
        long  cont = 0;
        for(int i=90000; i<1000000; i++){
            //System.out.println("----------Checking number "+ i + "---------------");
            aux = i;
            while(aux != 1){
                cont++;
                aux = getNextNumber(aux);
            }
            longs.add(cont);
            if(cont == 524){
                System.out.println("This is " + i);
                break;
            }

            cont = 0;
        }
        Collections.sort(longs);
        Collections.reverse(longs);
        System.out.println("The largest chain is of = " + longs.get(0));
    }


    public static long makeOp(long number){
        long resp = 0;
        if(isPair(number)){
            resp = number/2;
        }else{
            resp = number*3 + 1;
        }
        return resp;
    }

    public static boolean isPair(long i){
        if((i%2)==0){
            return true;
        }else{
            return false;
        }
    }

    public static long getNextNumber(long number){
        return makeOp(number);
    }

}
