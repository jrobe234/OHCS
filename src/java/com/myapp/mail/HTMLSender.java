/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class HTMLSender {

    private MimeMessage message;
    private Properties props;
    private Session session;
    private MimeMultipart mp;
    private String name = "";
    private String password = "";

    /**
     * 完成发送邮件的初始化工作
     * @param host
     */
    public HTMLSender(String host, String name, String password) {
        this.name = name;
        this.password = password;
        props = System.getProperties();
        // 设置SMTP主机
        props.put("mail.smtp.host", host);


        //设置SMTP验证属性
        props.put("mail.smtp.auth", "true");
        // 获得邮件会话对象
        MyAuthenticator auth = new MyAuthenticator(name, password);
        session = Session.getDefaultInstance(props, auth);
        // 创建MIME邮件对象
        message = new MimeMessage(session);
    }

    /**
     * 设置邮件发送人
     * @param from
     */
    public void setFrom(String from) {
        try {
            message.setFrom(new InternetAddress(from));
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置邮件收件人
     * @param to
     */
    public void setTo(String to) {
        try {
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置邮件主题
     * @param subject
     */
    public void setSubject(String subject) {
        try {
            message.setSubject(subject);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置邮件正文
     * @param text
     */
    public void setContent(String content) {
        try {
            message.setContent(content, "text/html");
            message.saveChanges();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送邮件
     * @return
     */
    public boolean send() {
        try {

            //创建SMTP邮件协议发送对象
            Transport transport = session.getTransport("smtp");
            //取得与邮件服务器的连接
            transport.connect((String) props.get("mail.smtp.host"), name, password);
            //通过邮件服务器发送邮件
            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
            transport.close();
            return true;
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
            return false;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
