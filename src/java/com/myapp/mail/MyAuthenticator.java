/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.mail;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */


public class MyAuthenticator extends Authenticator {
	String name;
	String password;

	public MyAuthenticator(String name, String password) {
		this.name = name;
		this.password = password;
		getPasswordAuthentication();
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(name, password);
	}
}
