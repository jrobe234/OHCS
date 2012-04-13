/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.account;

import org.csse3005gf.ohcs.hibernate.TimeTable;
import org.csse3005gf.ohcs.hibernate.User;
import org.csse3005gf.ohcs.hibernate.UserOperate;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class ShowDoctorAction extends ActionSupport {
   
    private User user;
    
    private TimeTable timetable;
    
    private Integer id;
    
    public ShowDoctorAction() {
    }
    
    
    // user pojo
    public User getUser(){
        return user;
    }
    
    public void setUser(User user){
        this.user= user;
    }
    
    // user id pojo
//    public Integer getId(){
//        return id;
//    }
//    
//    public void setId(Integer id){
//        this.id= id;
//    }
//            
    // timetable pojo
    public TimeTable getTimetable(){
        return timetable;
    }
    
    public void setTimetable(TimeTable timetable){
        this.timetable= timetable;
    }
    
    
    @Override
    public String execute() throws Exception {
        
        UserOperate uo= new UserOperate();
        
        String szId= ServletActionContext.getRequest().getParameter("id");
        
        int id= Integer.parseInt(szId);
        setUser(uo.getUserFromId(id));
        setTimetable(uo.getDocTimeTable(id));
        
        return SUCCESS;
        
    }
}
