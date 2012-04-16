/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.hibernate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class User_1 {

    /**
     *  14 variables in total!
     */
    private int userid;
    private String fname;
    private String lname;
    private String title;
    private String email;
    private String password;
    private String gender;
    private Date dob;
    private int phone;
    private String address;
    private int userType;
    private int guestUser;
    private String location;
    private float latitude;
    private float longitude;
    private String shortDescription;
    private String longDescription;
    private String photoPath;
    private double credit;

    // User id
    public int getUserid() {

        return userid;
    }

    public void setUserid(int userid) {

        this.userid = userid;
    }

    // email
    public String getEmail() {

        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // password
    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {

        this.password = password;

    }

    // first name
    public String getFname() {

        return fname;
    }

    public void setFname(String fname) {

        this.fname = fname;
    }

    // last name
    public String getLname() {

        return lname;
    }

    public void setLname(String lname) {

        this.lname = lname;
    }

    // gender
    public String getGender() {

        return gender;
    }

    public void setGender(String gender) {

        this.gender = gender;
    }

    // dob
    public Date getDob() throws ParseException {
        
        SimpleDateFormat df = new SimpleDateFormat("MM-dd-yyyy");
        return df.parse(df.format(dob));
    }

    public void setDob(Date dob) {

        this.dob = dob;
    }

    // address
    public String getAddress() {

        return address;
    }

    public void setAddress(String address) {

        this.address = address;
    }

    // phone
    public int getPhone() {

        return phone;
    }

    public void setPhone(int phone) {

        this.phone = phone;
    }

    // location
    public String getLocation() {

        return location;
    }

    public void setLocation(String location) {

        this.location = location;
    }

    // latitude
    public float getLatitude() {
        return latitude;

    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    // longitude
    public float getLongitude() {
        return longitude;

    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    // long description
    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    // shortDescription
    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
    
    
    // userType

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    // guestUser
    public int getGuestUser() {
        return guestUser;
    }

    public void setGuestUser(int guestUser) {
        this.guestUser = guestUser;
    }
    
    //photoPath
    
    public String getPhotoPath(){
        return photoPath;
    }
    
    public void setPhotoPath(String photoPath){
        this.photoPath= photoPath;
    }
    
    // credit
    
    public double getCredit(){
        return credit;
    }
    
    public void setCredit(double credit){
        this.credit= credit;
    }
    
    // extra functions:
    
    public String getFullname(){
        return this.getFname()+" "+ this.getLname();
    }
    
    // title

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
}
