/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twitterstima;

import java.lang.reflect.Array;

/**
 *
 * @author Tifani
 */
public class TwitterStima {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String a = "ababa";
        int[] fail = computeFail(a);
        for (int i=0;i<Array.getLength(fail);++i)
            System.out.print(a.charAt(i) + " ");
        System.out.println();
        for (int i=0;i<Array.getLength(fail);++i)
            System.out.print(fail[i] + " ");
        System.out.println();
        String text = "fsdfadababahfka";
        int found = KMPMatch(text, a);
        System.out.println(found);
        int found2 = BMMatch(text, a);
        System.out.println(found2);
        TwitterAPI.initializeTwitter();
        TwitterAPI.TwitterSearch("#kucing");
    }
    
    public static int KMPMatch (String text, String pattern) {
        int n = text.length();
        int m = pattern.length();
        
        int fail[] = computeFail(pattern);
        
        int i = 0;
        int j = 0;
        
        while (i < n) {
            if (pattern.charAt(j) == text.charAt(i)) {
                if (j == m-1) //char terakhir yang harus dicocokkan
                    return i - m + 1;
                ++i;
                ++j;
            }
            else if (j > 0)
                j = fail[j-1];
            else
                ++i;
        }
        return -1;
    }
    
    public static int[] computeFail(String pattern) {
        int[] fail = new int[pattern.length()]; //mengalokasikan array fail berukuran banyak char pada pattern
        fail[0] = 0;
        int m = pattern.length();
        int j = 0;
        int i = 1;
        while (i < m) { //mengevaluasi semua karakter
            if (pattern.charAt(j)==pattern.charAt(i)) { //sebanyak j+1 cocok
                fail[i] = j+1;
                ++i;
                ++j;
            }
            else if (j > 0) //j sama seperti matching prefix
                j = fail[j-1];
            else { //tidak ada yang sama
                fail[i] = 0;
                ++i;                
            }
        }
        return fail;        
    }
    
    public static int BMMatch (String text, String pattern) {
        int last[] = buildLast(pattern);
        int n = text.length();
        int m = pattern.length();
        int i = m-1;
        
        if (i > n-1)
            return -1; //tidak ada yang cocok jika pattern lebih panjang dari text
        int j = m-1;
        do {
            if (pattern.charAt(j) == text.charAt(i))
                if (j == 0)
                    return i; //match
                else { //teknik looking-glass
                    --i;
                    --j;                  
                }
            else { //teknik character-jump
                int lo = last[text.charAt(i)]; //last occ
                i = i + m - Math.min(j, 1+lo);
                j = m - 1;
            }
        } while (i<=n-1);
        return -1; //tidak ada kecocokan
    }
    
    public static int[] buildLast (String pattern) {
        int last[] = new int[128]; //ASCII char set
        for (int i=0; i<128; ++i)
            last[i] = -1; //inisialisasi nilai array
        for (int i=0; i<pattern.length(); ++i)
            last[pattern.charAt(i)] = i;
        return last;
    }
}
