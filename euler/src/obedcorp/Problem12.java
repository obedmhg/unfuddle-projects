package obedcorp;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * The sequence of triangle numbers is generated by adding the natural numbers. So the 7^(th) triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
 *
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 *
 * Let us list the factors of the first seven triangle numbers:

     1: 1
     3: 1,3
     6: 1,2,3,6
    10: 1,2,5,10
    15: 1,3,5,15
    21: 1,3,7,21
    28: 1,2,4,7,14,28
 *
 * We can see that 28 is the first triangle number to have over five divisors.
 *
 * What is the value of the first triangle number to have over five hundred divisors?
 *
 * @author jmurillo
 *
 */
public class Problem12 {
    public Problem12() {
    }

    public static void main(String[] args) {
        long triangleNumber = 0;
        for(int i=1; i<10000000; i++){
            triangleNumber = triangleNumber +  i;
            if(getNumberOfFactors(triangleNumber)>500){
                System.out.println("This is " + triangleNumber);
                break;
            }
        }
    }

    public static int getNumberOfFactors(long number){
        int resp = 0;
            for(int i=1; i<=number; i++){
                if((number%i)==0){
                    if((number/i)>i){
                        resp +=2;
                    }else{
                        break;
                    }
                }
            }
        return resp;

    }



}
