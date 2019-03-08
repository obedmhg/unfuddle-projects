package obedcorp;

/**
 *
 * Each new term in the Fibonacci sequence is generated by adding
 * the previous two terms. By starting with 1 and 2,
 * the first 10 terms will be:
 * 1 , 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 *
 * Find the sum of all the even-valued terms in the sequence
 * which do not exceed four million.
 *
 *
 * @author jmurillo
 *
 */

public class Problem2 {
    public Problem2() {
    }

    public static void main(String[] args) {
        long fibonSeq = 0;
        long [] resp = new long[100];
        resp[0] = 1;
            int i = 2;
            while(fibonSeq < 4000000){
                resp[i] = resp[i-1] + resp[i-2];
                fibonSeq = resp[i];
                i++;
            }
        long answer = getSum(resp);
        System.out.println(answer);

    }

    public static long getSum(long [] fiboSeq){
        long resp = 0;
        for(int i =0 ; i<fiboSeq.length; i++){
            if((fiboSeq[i]%2)==0){
                resp = fiboSeq[i] + resp;
            }
        }
        return resp;

    }

}
