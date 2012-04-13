/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.account;


import org.csse3005gf.ohcs.hibernate.User;
import org.csse3005gf.ohcs.hibernate.UserOperate;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */

public class LoginAction extends ActionSupport {

    public int id;
    private String email;
    private String password;
    private SessionUser su;

    public LoginAction() {
        // initialize the SessionUser ArrayList
    }

    /*
    public void addSessionUser(SessionUser su){
    
    // get the system Session user Arraylist 
    ArrayList<SessionUser> suTmp= getArr_sessUser();
    
    // add a new user
    suTmp.add(su);
    
    // copy to the system Session user Arraylist 
    setArr_sessUser(suTmp);
    
    
    
    } */
    @Override
    public String execute() throws Exception {

        UserOperate uo = new UserOperate();

        if (uo.isvalidate(getEmail(), getPassword())) {
            User user = uo.getUserFromEmail(getEmail());

            // if current user is GP
            if (user.getUserType() == 1) {

                // store SessionUser in the Session

                SessionUser su = new SessionUser(user.getFullname(), getEmail(),
                        user.getUserid(), user.getUserType(), user.getGuestUser(), user.getPhone(), uo.getDoctorAppointmentWith(user.getUserid()));

                ActionContext.getContext().getSession().put("SessionUser", su);
                setId(user.getUserid());

                return "doctor";
            } // if current user is patient
            else if (user.getUserType() == 2) {

                // store SessionUser in the Session

                SessionUser su = new SessionUser(user.getFullname(), getEmail(),
                        user.getUserid(), user.getUserType(), user.getGuestUser(), user.getPhone(), uo.getPatientAppointmentWith(user.getUserid()));

                ActionContext.getContext().getSession().put("SessionUser", su);
                setId(user.getUserid());
                return "patient";
            } // if current user is Admin
            else if (user.getUserType() == 0) {

                // store SessionUser in the Session

                SessionUser su = new SessionUser(user.getFullname(), getEmail(),
                        user.getUserid(), user.getUserType(), user.getGuestUser(), user.getPhone());

                ActionContext.getContext().getSession().put("SessionUser", su);
                setId(user.getUserid());
                return "admin";
            } else {
                return INPUT;
            }


        } else {
            return INPUT;
        }
    }

    /**
     * 
     * @param email 
     */
    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    /**
     * 
     * @param password 
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    /**
     * 
     * @param id 
     */
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public SessionUser getSu() {
        return su;
    }

    public void setSu(SessionUser su) {
        this.su = su;
    }
}
