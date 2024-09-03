/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.http.HttpServlet;
/**
 *
 * @author chotu
 */
public class compare  {
    
    public double check(String doc1,String doc2)  throws Exception {
         
         
        // Read the file names from the command line arguments
//        doc1 = "C:\\Users\\chotu\\Desktop\\abc\\"+doc1;
//        doc2 = "C:\\Users\\chotu\\Desktop\\abc\\"+doc2;
        
       
        // Read the file contents into strings
        String document1Content = readFileToString(new File(doc1));
        String document2Content = readFileToString(new File(doc2));

        // Tokenize the documents
        Set<String> words1 = tokenize(document1Content);
        Set<String> words2 = tokenize(document2Content);

        // Count the number of common words
        int commonWords = 0;
        for (String word : words1) {
            if (words2.contains(word)) {
                commonWords++;
            }
        }

        // Calculate the similarity
        double similarity = (double) commonWords / Math.max(words1.size(), words2.size()) * 100;

        System.out.println("Document 1 contains " + words1.size() + " unique words.");
        System.out.println("Document 2 contains " + words2.size() + " unique words.");
        System.out.println(commonWords + " words appear in both documents.");
        System.out.printf("The documents are %.2f%% similar.\n", similarity);
        
       return similarity;
        
    }

    
    
    

    private static String readFileToString(File file) throws IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
            sb.append("\n");
        }
        br.close();
        return sb.toString();
    }

    private static Set<String> tokenize(String text) {
        Set<String> words = new HashSet<>();
        String[] tokens = text.split("\\W+");
        for (String token : tokens) {
            if (!token.isEmpty()) {
                words.add(token.toLowerCase());
            }
        }
        return words;
    }
    
}
