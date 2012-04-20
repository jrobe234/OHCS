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
public class Prescript_1 {
    
    
    private int prescriptid;
    private int doctorid;
    private int patientid;
    private String title;
    private String content;
    private Date date;

    /**
     * 
     * @return 
     */
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 
     * @return 
     */
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * 
     * @return 
     */
    public int getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(int doctorid) {
        this.doctorid = doctorid;
    }

    /**
     * 
     * @return 
     */
    public int getPatientid() {
        return patientid;
    }

    public void setPatientid(int patientid) {
        this.patientid = patientid;
    }

    /**
     * 
     * @return 
     */
    public int getPrescriptid() {
        return prescriptid;
    }

    public void setPrescriptid(int prescriptid) {
        this.prescriptid = prescriptid;
    }

    /**
     * 
     * @return 
     */
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
    
    
}
