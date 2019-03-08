package obedcorp;

/**
 *
	If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

	If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

	NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 *
 * @author jmurillo
 *
 */
public class Problem17 {
    public Problem17() {
    }

    public static void main(String[] args) {
        String resp = "";
        for(int i=1; i<=1000; i++){
            resp = lowerNumbers(i, resp);
            //numbers 100 to 1000
             if(i >= 100 && i < 1000){
                int aux = i / 100;
                if((i%100) == 0){
                    resp = resp + getUnitString(aux) + getCentenasString();
                }else{
                    resp = resp + getUnitString(aux) + getCentenasString() + " and ";
                }
                int aux2 = (i%100);
                resp = resp + lowerNumbers(aux2, "");
             }
        }
        resp = resp + getMillaresString();
        String respToCount = resp.replace(" ","");
        respToCount = respToCount.replace("\n","");
        System.out.println(resp);
        //System.out.println(respToCount);
        System.out.println("Letters in total = " + respToCount.length());
    }

    public static String getUnitString(int i){
        String resp = "";
        switch(i){
            case 1 : {resp = "one"; break;}
            case 2 : {resp = "two"; break;}
            case 3 : {resp = "three"; break;}
            case 4 : {resp = "four"; break;}
            case 5 : {resp = "five"; break;}
            case 6 : {resp = "six"; break;}
            case 7 : {resp = "seven"; break;}
            case 8 : {resp = "eight"; break;}
            case 9 : {resp = "nine"; break;}
            case 10 : {resp = "ten"; break;}
            case 11 : {resp = "eleven"; break;}
            case 12 : {resp = "twelve"; break;}
            case 13 : {resp = "thirteen"; break;}
            case 14 : {resp = "fourteen"; break;}
            case 15 : {resp = "fifteen"; break;}
            case 16 : {resp = "Sixteen"; break;}
            case 17 : {resp = "seventeen"; break;}
            case 18 : {resp = "eighteen"; break;}
            case 19 : {resp = "nineteen"; break;}
        }
        return resp;
    }

    public static String getDecenasString(int i){
        String resp = "";
        switch(i){
            case 2 : {resp = "twenty"; break;}
            case 3 : {resp = "thirty"; break;}
            case 4 : {resp = "forty"; break;}
            case 5 : {resp = "fifty"; break;}
            case 6 : {resp = "sixty"; break;}
            case 7 : {resp = "seventy"; break;}
            case 8 : {resp = "eighty"; break;}
            case 9 : {resp = "ninety"; break;}
        }
        return resp;
    }

    public static String getCentenasString(){
        return "hundred";
    }

    public static String getMillaresString(){
        return "onethousand";
    }

    public static String lowerNumbers(int i, String param){
        String resp = param;
        //number 1 to 19
        if(i <= 20){
            resp = resp + getUnitString(i) + "\n";
        }
        //numbers 20 to 99
        if(i > 19 && i < 100){
            int aux = i/10;
            resp = resp + getDecenasString(aux);
            int aux2 = (i%10);
            resp = resp + getUnitString(aux2)+ "\n";
        }
        return resp;
    }


}
