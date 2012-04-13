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
public class Consultation {
    
    /**
     *  total 6
     */
    private int consultationid;
    private Date startDateTime;
    private Date endDateTime;
    private int doctorid;
    private int patientid;
    private String content;

    
    // consultation id
    public void setConsultationid(int consultationid){
        this.consultationid= consultationid;
    }
    
    public int getConsultationid(){
        return consultationid;
    }
    
    
    // start time 
    
    public void setStartDateTime(Date startDateTime){
        this.startDateTime= startDateTime;
    }
            
    public Date getStartDateTime(){
        return startDateTime;
    }
    
    
    // end time
    
    public void setEndDateTime(Date endDateTime){
        this.endDateTime= endDateTime;
    }
    
    public Date getEndDateTime(){
        return endDateTime;
    }
    
    // doctor id
    
    public void setDoctorid(int doctorid){
        this.doctorid= doctorid;
    }
    
    public int getDoctorid(){
        return doctorid;
    }
    
    //patient id
    
    public void setPatientid(int patientid){
        this.patientid= patientid;
    }
    
    public int getPatientid(){
        return patientid;
    }
 
    // content
    
    public void setContent(String content){
        this.content= content;
    }
 
    public String getContent(){
        return content;
    }
}
