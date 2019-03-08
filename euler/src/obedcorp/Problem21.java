package obedcorp;

import java.util.ArrayList;
import java.util.List;

/**
 *
	Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
	If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

	For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

	Evaluate the sum of all the amicable numbers under 10000.
 *
 * @author jmurillo
 *
 */
public class Problem21 {

    static List amicables = new ArrayList();
    public Problem21() {
    }

    public static void main(String[] args) {
        int resp = 0;
        for(int i=0; i<=10000; i++){
            if(!numberAlreadyExist(i)){
                processAmicable(i);
            }
        }
        for(Object number : amicables){
            Integer num = (Integer) number;
            System.out.println(num);
            resp += num;
        }
        System.out.println("The result is " + resp);
    }

    public static void processAmicable (int number){
        int amicable = 0;
        amicable = d(number);
        if (number==d(amicable)){
            if(number!=amicable){
                amicables.add(number);
                amicables.add(amicable);
            }
        }
    }

    public static int d(int number){
        int resp = 0;
        for(int i=1; i<=(number/2); i++){
            if((number%i)==0){
                resp += i;
            }
        }
        return resp;
    }

    public static boolean numberAlreadyExist(int number){
        if(amicables.contains(number)){
            return true;
        }else{
            return false;
        }
    }

}
