package org.csse3005gf.ohcs.consultation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;

/**
 * Send HTML Email function
 * 
 * you need to call the method named 'send()'
 * 
 * @author Ben <arkilis@gmail.com>
 */
public class SendEmail_1 {

    public SendEmail_1() {
    }

    public static void main(String[] args) {
        //sendText("smtp.gmail.com", "arkilis@gmail.com", "ben2010bne", "uqyliu19@uq.edu.au");
        //sendText("smtp.gmail.com", "arkilis@gmail.com", "ben2010bne", "uqyliu19@uq.edu.au");
    }

    /**
     * 
     * @param szHost e.g. smtp.gmail.com
     * @param szFrom: From Email Account
     * @param szPwd: From Email Account password
     * @param szTo: To destination Account  
     * @param szTitle: Title
     * @param szContent: Content
     * 
     */
    public static void sendText(String szHost, String szFrom, String szPwd, String szTo, String szTitle, String szContent) {
        SimpleEmail email = new SimpleEmail();
        email.setTLS(true);
        email.setSSL(true);
        email.setHostName(szHost);
        email.setAuthentication(szFrom, szPwd);   // put in your user name and password   

        try {
            email.addTo(szTo); // receiver     
            email.setFrom(szFrom);       // Sender       
            email.setSubject(szTitle);         // title       
            email.setMsg(szContent);   // content       
            email.send();

        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

    /**
     * 
     * @param szHost e.g. smtp.gmail.com
     * @param szFrom: From Email Account
     * @param szPwd: From Email Account password
     * @param szTo: To destination Account
     * @param szTitle: Title
     * @param szContent: Can be html file path
     * 
     */
    
    public static void sendHTML(String szHost, String szFrom, String szPwd, 
            String szTo, String szTitle, String szHTMLPath) throws IOException {
        HtmlEmail email = new HtmlEmail();
        email.setTLS(true);
        email.setSSL(true);
        email.setHostName(szHost);
        email.setAuthentication(szFrom, szPwd);   // put in your user name and password   

        try {
            email.addTo(szTo); // receiver     
            email.setFrom(szFrom);       // Sender       
            email.setSubject(szTitle);         // title       
            email.setHtmlMsg(readHTML(szHTMLPath));   // content       
            email.send();

        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

    
    /**
     * 
     * @param path: The html file path, e.g. t1.html
     * @return
     * @throws IOException 
     */
    public static String readHTML(String path) throws IOException {

        // Open a html file from local disk

        String html = "";
        File file = new File(path);
        BufferedReader bf = new BufferedReader(new FileReader(file));
        StringBuilder str = new StringBuilder();

        while (html != null) {
            html = bf.readLine();
            if (html == null) {
                break;
            }
            str.append(html.trim());
        }
        bf.close();
        return str.toString();
    }
    
    
    
}
