package obedcorp;

/**
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 *
 * @author jmurillo
 *
 */
public class Problem5 {
    public Problem5() {
    }

    public static void main(String[] args) {
        for(int j=2520; j<1000000000; j+=5){
            for(int i=1; i<=20; i++){
                if((j%i)!=0){
                    break;
                }
                if(i==20){
                    System.out.println(j + " is Divisible");
                }
            }
        }

    }
}
