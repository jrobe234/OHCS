/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.hibernate;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class Invoice_1 {
    
    private int invoiceid;
    private int doctorid;
    private int patientid;
    private float expense;
    private int duration;
    private int prescriptid;
    
    
    // invoice id
    public void setInvoiceid(int invoiceid){
        this.invoiceid= invoiceid;
    }
    
    public int getInvoiceid(){
        return invoiceid;
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
    
    // expence
    
    public void setExpense(float expense){
        this.expense= expense;
    }
    
    public float getExpense(){
        return expense;
    }
    
    //duration
    
    public void setDuration(int duration){
        this.duration= duration;
    }
    
    public int getDuration(){
        return duration;
    }
    
    //prescriptid
    
    public void setPrescriptid(int prescriptid){
        this.prescriptid= prescriptid;
    }
    
    public int getPrescriptid(){
        return prescriptid;
    }
}
