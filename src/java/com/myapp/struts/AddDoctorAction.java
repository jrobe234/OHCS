/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import com.myapp.hibernate.UserOperate;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;
import com.myapp.mail.SendHTMLMail;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class AddDoctorAction extends ActionSupport {
    
    
    // get the form value from reg_gp.jsp
    
    private String fname;
    private String lname;
    private String email;
    private String password;
    private String gender;
    private Date dob;
    private int phone;
    private String address;
    
    private String location;
    private float latitude;
    private float longitude;
    private int userType;
    
    private String longDescription;
    private String photoPath;
    
    
    
//    public AddDoctorAction() {
//    }
    
    @Override
    public String execute() throws Exception {
        
        UserOperate uo= new UserOperate();
        uo.InsertDoctor(getFname(), getLname(), getEmail(), getPassword(), 
                getGender(), getDob(), getPhone(), getAddress(), 
                getLocation(), getLatitude(), getLongitude(), getLongDescription());
        
        // send welcome email
        SendHTMLMail.sendEmail("arkilis@163.com", getEmail(), "Welcome","Register successfully!");
        
        return SUCCESS;
        
        
    }
    
    // email
    public String getEmail(){
        
        return email;
    }
            
    public void setEmail(String email){
        this.email= email;
    }
    
    // password
    public String getPassword(){
        
        return password;
    }
    
    public void setPassword(String password){
        
        this.password= password;
 
    }
    
    // first name
    public String getFname(){
        
        return fname;
    }
    
    public void setFname(String fname){
        
        this.fname= fname;
    }
        
    // last name
    public String getLname(){
        
        return lname;
    }
    
    public void setLname(String lname){
        
        this.lname= lname;
    }
    
    // gender
   
    public String getGender(){
        
        return gender;
    }
    
    public void setGender(String gender){
        
        this.gender= gender;
    }
    
    // dob
    public Date getDob(){
        
        return dob;
    }
    
    public void setDob(Date dob){
        
        this.dob= dob;
    }
    
    // address
    public String getAddress(){
        
        return address;
    }
    
    public void setAddress(String address){
        
        this.address= address;
    }
    
    
    // phone
    public int getPhone(){
        
        return phone;
    }
    
    public void setPhone(int phone){
        
        this.phone= phone;
    }
    
    // location
    public String getLocation(){
        
        return location;
    }
    
    public void setLocation(String location){
        
        this.location= location;
    }
    
    // latitude
    public float getLatitude(){
        return latitude;
        
    }
    
    public void setLatitude(float latitude){
        this.latitude= latitude;
    }
    
    // longitude
    public float getLongitude(){
        return longitude;
        
    }
    
    public void setLongitude(float longitude){
        this.longitude= longitude;
    }
    
    // long description
    
    public String getLongDescription(){
        return longDescription;
    }
    
    public void setLongDescription(String longDescription){
        this.longDescription= longDescription;
    }
    
        
    // userType

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }
    
    //photoPath
    
    public String getPhotoPath(){
        return photoPath;
    }
    
    public void setPhotoPath(String photoPath){
        this.photoPath= photoPath;
    }
}
