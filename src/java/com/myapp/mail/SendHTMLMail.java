/*
 *  This is a Servlet that can send email.
 *  Just need to change the SMTP address, Account name and password.
 * 
 */
package com.myapp.mail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class SendHTMLMail{



    public String readHTML(String path) throws IOException {

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
      
    public static void sendEmail(String fromEmail, String toEmail, String emailSubject, String emailContent){
        
        //设置是163邮箱的SMTP地址
        String host = "smtp.163.com";
        //String host= "smtp.gmail.com";
        //设置邮箱账户名称
        String name = "arkilis";
        //设置邮箱帐号密码
        String password = "zxr2005==";
        
        //设置邮件的账号信息
        HTMLSender mail = new HTMLSender(host, name, password);
        
        // Sender's Account
        mail.setFrom(fromEmail);
        
        // Receiver's Account
        mail.setTo(toEmail);
        
        // Subject of the Email    
        mail.setSubject(emailSubject);
        
         // Email Content
        
        mail.setContent(emailContent);
        
        
        //发送邮件
        if (mail.send()) {
            System.out.println("success!");
        } else {
            System.out.println("failed!");
        }
    }
    
    public static void main(String args[]){
        
        sendEmail("arkilis@163.com","arkilis@gmail.com","Test","Test");
    
    }
}