package obedcorp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 *
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6^(th) prime is 13.
 *
 * What is the 10001^(st) prime number?
 *
 * @author jmurillo
 *
 */
public class Problem67 {

    private static final String ARRAY_FILE = "C:\\_apps\\ProjectEuler\\EulerProject\\src\\obedcorp\\extraFiles\\triangle.txt";
    //static int [][] array = null;
    static Data [][] da = new Data[100][];


    public Problem67() {
    }

    public static void recFunction(int index){
        Data [] rowF = da[index];
        Data [] rowS = da[index+1];
        for(int i=0; i<rowS.length; i++ ){
            if(i==0){
                rowS[i].peso = rowS[i].peso + rowF[i].peso;
                rowS[i].pathPesoMax =  rowF[i].value + "->" + rowF[i].pathPesoMax;
            }else if(i==rowS.length-1){
                rowS[i].peso = rowS[i].peso + rowF[rowF.length-1].peso;
                rowS[i].pathPesoMax =  rowF[rowF.length-1].value + "->" + rowF[rowF.length-1].pathPesoMax;
            }else{
                Data max = getMaxData(new Data[] {rowF[i], rowF[i-1]});
                rowS[i].peso = rowS[i].peso + max.peso;
                rowS[i].pathPesoMax =  max.value + "->" + max.pathPesoMax;
            }
        }
        index = index+1;

        if(index==99){
            System.out.println("This is the path [ " + getMaxData(da[99]).pathPesoMax + "]");
            String resp [] =  getMaxData(da[99]).pathPesoMax.split("->");
            int sum = 0;
            for(String num : resp){
                sum = sum +  Integer.parseInt(num);
            }
            sum =  sum + getMaxData(da[99]).value;
            System.out.println("The sum of the max path is = " +  sum);
            System.exit(0);
        }

        recFunction(index);

    }

    public static Data getMaxData(Data[] array){
        List list = new ArrayList();
        Data resp = null;
        for(Data d : array)
            list.add(d.peso);
        Collections.sort(list);
        Collections.reverse(list);
        for(Data d : array){
            int mayor = ((Integer) list.get(0)).intValue();
            if(d.peso==mayor){
                resp = d;
            }
        }
        return resp;

    }

    public static void main(String [] args) {
        Problem67 p67 = new Problem67();

        try {
            List <String> names = new ArrayList();
            BufferedReader reader= new BufferedReader(new FileReader(ARRAY_FILE));
            int cont = 0;
            while(reader.readLine()!=null){
                cont++;
            }
            int [][] tempArray = new int[cont][];
            reader= new BufferedReader(new FileReader(ARRAY_FILE));
            int j = 0;
            boolean eof = false;
            while(!eof){
                String s = reader.readLine();
                if(s==null)
                    s = "";
                 int [] array = null;
                 array = new int[s.split(",").length];

                for(int i=0; i<s.split(",").length-1;i++){
                    array[i] = Integer.parseInt(""+s.split(",")[i]);
                }

                if(j<100){
                    if(j==0){
                            array = new int[1];
                            int num = Integer.parseInt(""+s);
                            array[0] = num;
                    }
                    tempArray [j] = array;
                }
                j++;
                if(s==""){
                    eof = true;
                }
            }

            p67.start(tempArray);

        }
        catch (FileNotFoundException e) {

        }
        catch (IOException e) {

        }




    }

    public static void start(int [][] array){
        for(int i=0; i< array.length-1; i++){
            if(array[i]!=null){
                Data data [] = new Data[array[i].length];
                for(int j=0; j<array[i].length; j++){
                    data[j] = new Data();
                    data[j].value = array[i][j];
                    data[j].peso = data[j].value;
                    da[i] = data;
                }
            }
        }
        if(array[99]!=null){
            da [99] = new Data[array[99].length];
            for(int i=0; i<array[99].length; i++){
                da[99][i] = new Data();
                da[99][i].value = array[99][i];
                da[99][i].peso = da[99][i].value;
            }
        }
        recFunction(0);
    }

}
