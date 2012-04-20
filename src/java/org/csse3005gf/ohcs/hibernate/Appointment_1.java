/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.hibernate;

import java.util.Date;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class Appointment_1 {
    
    private int appointmentid;
    private Date date;
    private String week;
    private String time;
    private int patientid;
    private int doctorid;
    
    // appointmentid
    public void setAppointmentid(int appointmentid){
        this.appointmentid= appointmentid;
    }
    
    public int getAppointmentid(){
        return appointmentid;
    }
    
    // date
    public void setDate(Date date){
        this.date= date;
    }
    
    public Date getDate(){
        return date;
    }
    
    // Week
    public void setWeek(String week){
        this.week= week;
    }
    
    public String getWeek(){
        return week;
    }
    
    // Time
    
    public void setTime(String time){
        this.time= time;
    }
    
    public String getTime(){
        return time;
    }
    
    // Patient Id
    public void setPatientid(int patientid){
        this.patientid= patientid;
    }
    
    public int getPatientid(){
        return patientid;
    }
    
    // Doctor id
    public void setDoctorid(int doctorid){
        this.doctorid= doctorid;
    }
    
    public int getDoctorid(){
        return doctorid;
    }
    
}
