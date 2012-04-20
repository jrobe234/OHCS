/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.hibernate;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class TimeTable_1 {
    
    
    private int timetableid;
    private int doctorId;
    private String mon;
    private String tue;
    private String wed;
    private String thu;
    private String fri;
    private String sat;
    private String sun;
    
    
    // TimeTable id
    
    public void setTimetableid(int timetableId){
        this.timetableid= timetableId;
    }
    
    public int getTimetableid(){
        return timetableid;
    }
    
    // doctor id
    public void setDoctorId(int doctorId){
        this.doctorId= doctorId;
    }
    
    public int getDoctorId(){
        return doctorId;
    }
    
    // monday   
    public void setMon(String monday){
        this.mon= monday;
    }
    
    public String getMon(){
        return mon;
    }
    
    // Tuesday
    public void setTue(String tuesday){
        this.tue= tuesday;
    }
    
    public String getTue(){
        return tue;
    }
    
    // Wednesday
    public void setWed(String wednesday){
        this.wed= wednesday;
    }
    
    public String getWed(){
        return wed;
    }
    
    // Thursday
    public void setThu(String thursday){
        this.thu= thursday;
    }
    
    public String getThu(){
        return thu;
    }
    
    // Friday
    public void setFri(String friday){
        this.fri= friday;
    }
    
    public String getFri(){
        return fri;
    }
    
    // Saturday
    public void setSat(String saturday){
        this.sat= saturday;
    }
    
    public String getSat(){
        return sat;
    }
    
    // Sunday
    
    public void setSun(String sunday){
        this.sun= sunday;
    }
    
    public String getSun(){
        return sun;
    }
    
}
