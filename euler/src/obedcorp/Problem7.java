package obedcorp;

public class Problem7 {
    public Problem7() {
    }

    public static void main(String[] args) {
        int cont = 0;
        for(int i=2; i<10000000; i++){
            if(isPrime(i)){
                cont++;
            }
            if(cont==10001){
                System.out.println("The 10001 prime is " + i);
                break;
            }
        }
    }
    
    static boolean isPrime(int n) {
    
        if (n <= 2) {
            return true;
        }
        if (n % 2 == 0) {
            return false;
        }    
        for (int i = 3, end = (int)Math.sqrt(n); i <= end; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
    
        return true;
    }
}
