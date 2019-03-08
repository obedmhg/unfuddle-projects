package obedcorp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
	A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

	A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

	As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

	Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 *
 * @author jmurillo
 *
 */
public class Problem23 {
    public Problem23() {
    }
    static List abundants = new ArrayList();
    public static void main(String[] args) {
        long resp = 0;
        int cont = 0;
        for(int i=12; i<=28123; i++){
            if(isAbundantNumber(i)){
                abundants.add(i);
            }
        }

        for(int i=1; i<=28123 ; i++){
            if(!isSumedBy2Abundants(i)){
                System.out.println(i);
                resp += i;
                cont++;
            }
        }
        System.out.println("Numeros encontrados = " + cont);
        System.out.println("The result is " + resp);

    }


    public static boolean isAbundantNumber(int number){
        int sumOfDivs = 0;
        for(int i=1; i<=(number/2); i++){
            if((number%i)==0){
                sumOfDivs += i;
            }
        }
        if(number<sumOfDivs){
            return true;
        }else{
            return false;
        }
    }

    public static boolean isSumedBy2Abundants(int number){
        boolean resp = false;
        if(number<24){
            return resp;
        }
        for(int i=0; i<abundants.size(); i++){
            Integer integer = (Integer)abundants.get(i);
            if(integer>number){
                break;
            }
            if(abundants.contains((number-integer))){
                resp =  true;
                break;
            }

        }
        return resp;
    }


    public static boolean numberAlreadyExist(int number, List list){
        if(list.contains(number)){
            return true;
        }else{
            return false;
        }
    }

    public static boolean isPair(int number){
        if((number%2)==0){
            return true;
        }else{
            return false;
        }
    }



}
