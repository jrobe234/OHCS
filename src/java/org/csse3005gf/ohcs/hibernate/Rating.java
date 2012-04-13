/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.hibernate;

public class Rating {
    
    private int ratingid;
    private int patientid;
    private int doctorid;
    private int overallrating;
    private int punctuality;
    private int knowledge;
    private int empathy;
    private int communication;
    private String comments;
    
    public void setRatingid(int ratingid){
        this.ratingid= ratingid;
    }
    
    public int getRatingid(){
    
        return ratingid;
    }
    
    
    /**
     * 
     * @param doctorid 
     */
    public void setDoctorid(int doctorid){
        this.doctorid= doctorid;
    }
    
    public int getDoctorid(){
        return doctorid;
    }
    
    /**
     * 
     * @param patientid 
     */
    public void setPatientid(int patientid){
        this.patientid= patientid;
    }
    
    public int getPatientid(){
        return patientid;
    }
    
    /**
     * 
     * @param overallrating 
     */
    public void setOverallrating(int overallrating){
        this.overallrating= overallrating;
    }
    
    public int getOverallrating(){
        return overallrating;
    }
    
    /**
     * 
     * @param punctuality 
     */
    public void setPunctuality(int punctuality){
        this.punctuality= punctuality;
    }
    
    public int getPunctuality(){
        return punctuality;
    }
    
    
    /**
     * 
     * @param knowledge 
     */
    public void setKnowledge(int knowledge){
        this.knowledge= knowledge;
    }
    
    public int getKnowledge(){
        return knowledge;
    }
 
    /**
     * 
     * @param empathy 
     */
    public void setEmpathy(int empathy){
        this.empathy= empathy;
    }
    
    public int getEmpathy(){
        return empathy;
    }
    
    
    /**
     * 
     * @param communication 
     */
    public void setCommunication(int communication){
        this.communication= communication;
    }
    
    public int getCommunication(){
        return communication;
    }
    
    public void setComments(String comments){
        this.comments= comments;
    }
    
    public String getComments(){
        return comments;
    }
}
