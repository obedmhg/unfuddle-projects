package obedcorp;

import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 You are given the following information, but you may prefer to do some research for yourself.

    * 1 Jan 1900 was a Monday.
    * Thirty days has September,
      April, June and November.
      All the rest have thirty-one,
      Saving February alone,
      Which has twenty-eight, rain or shine.
      And on leap years, twenty-nine.
    * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

	How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

 *
 * @author jmurillo
 *
 */
public class Problem19 {
    public Problem19() {
    }
    static int days = 0;
    public static void main(String[] args) {
        // 100 year 12 times divided by 7
        int resp = (100 * 12)/7;
        System.out.println(resp);

    }

    public static boolean isLeapYear(int year){
        boolean resp = false;
        if((year%400)==0){
            resp = true;
        }else if((year%100)!=0){
            if((year%4)==0){
                resp = true;
            }
        }else{
            resp = false;
        }

        return resp;
    }

    public static String startDay(long year){
        String resp = "";
            long res = year%7;
            switch ((int)res){
                case 0: {resp = "monday"; break;}
                case 1: {resp = "thursday"; break;}
                case 2: {resp = "wedensday"; break;}
                case 3: {resp = "thurstday"; break;}
                case 4: {resp = "friday"; break;}
                case 5: {resp = "saturday"; break;}
                case 6: {resp = "sunday"; break;}
            }
        return resp;
    }

    public static boolean monthStartWith(int startDay, int month, boolean leap){
        boolean test = true;
        if(month == 2){
            if(leap){

            }
        }
        return test;
    }



}
