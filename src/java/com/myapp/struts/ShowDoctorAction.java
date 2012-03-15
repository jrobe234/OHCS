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
public class ShowDoctorAction extends ActionSupport {
   
    private User user;
    
    private Integer id;
    
    public ShowDoctorAction() {
    }
    
    public User getUser(){
        return user;
    }
    
    public void setUser(User user){
        this.user= user;
    }
    
    public Integer getId(){
        return id;
    }
    
    public void setId(Integer id){
        this.id= id;
    }
            
    @Override
    public String execute() throws Exception {
        
        UserOperate uo= new UserOperate();
        
        setUser(uo.getUserFromId(getId()));
        
        return SUCCESS;
        
    }
}
