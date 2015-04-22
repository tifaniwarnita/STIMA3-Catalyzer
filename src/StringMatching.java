import java.util.*;
import twitter4j.*;

public class StringMatching {
    
    private int AlgoType;
    private List<Status> tweets;
    
    public StringMatching() {
        AlgoType = 0;   // kmp
        List<Status> tweets = new ArrayList<Status>();
    }
    
    public void setAlgo (String type) {
        if (type.equalsIgnoreCase("BM"))
            AlgoType = 1;
        else    // kmp
            AlgoType = 0;
    }

    public static int kmpMatch(String text, String pattern) {
		int n = text.length();
		int m = pattern.length();
		int fail[] = computeFail(pattern);
		int i=0;
		int j=0;
		while (i < n) {
            if (pattern.charAt(j) == text.charAt(i)) {
				if (j == m - 1)
                   return i - m + 1; // match
				i++;
				j++;
            }
            else if (j > 0)
				j = fail[j-1];
            else
				i++;
		}
		return -1; // no match
    }

    public static int[] computeFail(String pattern) {
		int fail[] = new int[pattern.length()];
		fail[0] = 0;
		int m = pattern.length();
		int j = 0;
		int i = 1;
		while (i < m) {
            if  (pattern.charAt(j) == pattern.charAt(i)) {   //j+1 chars match
				fail[i] = j + 1;
				i++;
				j++;
            }
            else if (j > 0) // j follows matching prefix
				j = fail[j-11];
            else {     // no match
				fail[i] = 0;
				i++;
            }
		}
		return fail;
    }
	
    public static int bmMatch(String text, String pattern) {
		int last[] = buildLast(pattern);
		int n = text.length();
		int m = pattern.length();
		int i = m-1;
		if (i > n-1)
    		return -1; // no match if pattern is longer than text
		int j = m-1;
		do {
    	    if (pattern.charAt(j) == text.charAt(i))
				if (j == 0)
           			return i; // match
				else { // looking-glass technique
           			i--;
           			j--;
				}
      		else { // character jump technique
				int lo = last[text.charAt(i)];  //last occ
				i = i + m - Math.min(j, 1+lo);
				j = m - 1;
      		}
		} while (i <= n-1);
		return -1; // no match
  	}
	
    public static int[] buildLast(String pattern) {
    /* Return array storing index of last occurrence of each ASCII char in pattern. */
		int last[] = new int[128]; // ASCII char set
		for(int i=0; i < 128; i++)
            last[i] = -1; // initialize array
		for (int i = 0; i < pattern.length(); i++)
            last[pattern.charAt(i)] = i;
		return last;
    }
 
    public List<List<Status>> Analyze (List<String> input) {
        
        int posn = -1;
        int i = 0;
                
        List<Status> result1 = new ArrayList<Status>();
        List<Status> result2 = new ArrayList<Status>();
        List<Status> result3 = new ArrayList<Status>();
        List<Status> result4 = new ArrayList<Status>();
        
        String[] keyword = input.get(0).split("\\;");
        while (i<keyword.length) {
            keyword[i]=keyword[i].trim();
            i++;
        }
        
        i = 0;
        String key = new String("(" + keyword[0] + ")");
        while (i<keyword.length) {
            key = key + "OR" + "(" + keyword[i] + ")";
            i++;
        }
        
        TwitterAPI.initializeTwitter();
        tweets = TwitterAPI.TwitterSearch(key);
        
        String[] kategori1 = input.get(1).split("\\,");
        while (i<kategori1.length) {
            kategori1[i]=kategori1[i].trim();
            i++;
        }
        String[] kategori2 = input.get(2).split("\\,");
        i=0;
        while (i<kategori2.length) {
            kategori2[i]=kategori2[i].trim();
            i++;
        }
        String[] kategori3 = input.get(3).split("\\,");
        i=0;
        while (i<kategori3.length) {
            kategori3[i]=kategori3[i].trim();
            i++;
        }
        
        for (Status tweet : tweets) {
            i = 0;
            if (AlgoType==0) { // KMP
                while ((posn==-1)&&(i<kategori1.length)) {
                    posn = kmpMatch(tweet.getText(), kategori1[i]);
                    i++;
                }
				if (posn!=-1)
                    result1.add(tweet);
				else {
                    while ((posn==-1)&&(i<kategori2.length)) {
                        posn = kmpMatch(tweet.getText(), kategori2[i]);
                        i++;
                    }
                    if (posn!=-1)
                        result2.add(tweet);
                    else {
                        while ((posn==-1)&&(i<kategori3.length)) {
                            posn = kmpMatch(tweet.getText(), kategori3[i]);
                            i++;
                        }
                        if (posn!=-1)
                            result3.add(tweet);
                        else
                            result4.add(tweet);
                    }
                }
            }
            else { // BM
                while ((posn==-1)&&(i<kategori1.length)) {
                    posn = bmMatch(tweet.getText(), kategori1[i]);
                    i++;
                }
				if (posn!=-1)
                    result1.add(tweet);
				else {
                    while ((posn==-1)&&(i<kategori2.length)) {
                        posn = bmMatch(tweet.getText(), kategori2[i]);
                        i++;
                    }
                    if (posn!=-1)
                        result2.add(tweet);
                    else {
                        while ((posn==-1)&&(i<kategori3.length)) {
                            posn = bmMatch(tweet.getText(), kategori3[i]);
                            i++;
                        }
                        if (posn!=-1)
                            result3.add(tweet);
                        else
                            result4.add(tweet);
                    }
                }
            } 
        }
        
        List<List<Status>> result = new ArrayList<List<Status>>();
        result.add(result1);
        result.add(result2);
        result.add(result3);
        result.add(result4);
        return result;
    }
        
    public static void main(String[] args) {
        
        // BIKIN LIST INPUT
        List<String> input = new ArrayList<String>();
        input.add("#hiburan; #jkt48");                  // keyword
        input.add("syahrini, video klip, k-pop");       // keyword kategori 1
        input.add("nonton, bioskop, cinema");           // keyword kategori 2
        input.add("dahsyat, rcti, sinetron");           // keyword kategori 3
        
        
        // STRING MATCH
        StringMatching S = new StringMatching();
        List<List<Status>> result = new  ArrayList<List<Status>>();
        result = S.Analyze(input);
        
        
        // PRINT HASIL
        System.out.println("KEYWORD = " + input.get(0));
        System.out.println();
        for (int j=0; j<4; j++) {
            int i = 0;
            System.out.println("KATEGORI " + j);
            while (i<result.get(j).size()) {
                System.out.println(result.get(j).get(i).getText());
                i++;
            }
            System.out.println();
        }
        
    }
    
}
