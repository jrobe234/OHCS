/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import com.myapp.hibernate.User;
import com.myapp.hibernate.UserOperate;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class LoginAction extends ActionSupport {

    private String email;
    private String password;

    public LoginAction() {
    }

    @Override
    public String execute() throws Exception {
    
        UserOperate uo= new UserOperate();
        
        if(uo.isvalidate(getEmail(), getPassword()))
            return SUCCESS;
        else
            return INPUT;
    }
    
    public void setEmail(String email){
        this.email= email;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setPassword(String password){
        this.password= password;
    }
    
    public String getPassword(){
        return password;
    }
}
