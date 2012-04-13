/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.account;

import java.util.ArrayList;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class SessionUser {

    private String fullName;
    private String email;
    private int userid;
    private int user_type;
    private int guest_user;
    private int phone;
    private ArrayList appointwith;


    public SessionUser(String fullname, String email, int userid,
            int user_type, int guest_user, int phone, ArrayList appointwith) {
        this.fullName = fullname;
        this.email = email;
        this.user_type = user_type;
        this.userid = userid;
        this.phone = phone;
        this.guest_user = guest_user;
        this.appointwith= appointwith;
    }

    
    public SessionUser(String fullname, String email, int userid,
            int user_type, int guest_user, int phone) {
        this.fullName = fullname;
        this.email = email;
        this.user_type = user_type;
        this.userid = userid;
        this.phone = phone;
        this.guest_user = guest_user;
        
    }
    
    
    
    public ArrayList getAppointwith() {
        return appointwith;
    }

    public void setAppointwith(ArrayList appointwith) {
        this.appointwith = appointwith;
    }

    
    
    public void setFullname(String fullname) {
        this.fullName = fullname;
    }

    public String getFullName() {
        return fullName;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getGuest_user() {
        return guest_user;
    }

    public void setGuest_user(int guest_user) {
        this.guest_user = guest_user;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
}
