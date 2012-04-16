package org.csse3005gf.ohcs.hibernate;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import org.json.simple.JSONObject;

/**
 *
 * @author s4143132
 */
public class EServices {
    private int serviceID;
    private String sname;
    private String activities;
    private String addr;
    private String suburb;
    private String state;
    private String pcode;
    private String products;
    private String phone;
    private String email;
    private String homepage;
    private String keywords;
    private double latitude;
    private double longitude;
    private String desc;
    private int serviceType;
    
   public EServices(int ident, double lat,double lng, String nme, String ph, String dsc, int sType) {
       serviceID = ident;
       latitude = lat;
       longitude = lng;
       sname = nme;
       phone = ph;
       desc = dsc;
       serviceType = sType;
   }
    
    public JSONObject toJSONObject(){
        JSONObject jsonHCS = new JSONObject();
        jsonHCS.put("ID", getServiceID());
        jsonHCS.put("name", getSname());
        jsonHCS.put("phone", getPhone());
        jsonHCS.put("latitude", getLatitude());
        jsonHCS.put("longitude", getLongitude());
        jsonHCS.put("desc", getDesc());
        jsonHCS.put("serviceType", getServiceType());
        return jsonHCS;
    }

    /**
     * @return the sname
     */
    public String getSname() {
        return sname;
    }

    /**
     * @param sname the sname to set
     */
    public void setSname(String sname) {
        this.sname = sname;
    }

    /**
     * @return the activities
     */
    public String getActivities() {
        return activities;
    }

    /**
     * @param activities the activities to set
     */
    public void setActivities(String activities) {
        this.activities = activities;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the suburb
     */
    public String getSuburb() {
        return suburb;
    }

    /**
     * @param suburb the suburb to set
     */
    public void setSuburb(String suburb) {
        this.suburb = suburb;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the pcode
     */
    public String getPcode() {
        return pcode;
    }

    /**
     * @param pcode the pcode to set
     */
    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    /**
     * @return the products
     */
    public String getProducts() {
        return products;
    }

    /**
     * @param products the products to set
     */
    public void setProducts(String products) {
        this.products = products;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the homepage
     */
    public String getHomepage() {
        return homepage;
    }

    /**
     * @param homepage the homepage to set
     */
    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    /**
     * @return the keywords
     */
    public String getKeywords() {
        return keywords;
    }

    /**
     * @param keywords the keywords to set
     */
    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    /**
     * @return the latitude
     */
    public double getLatitude() {
        return latitude;
    }

    /**
     * @param latitude the latitude to set
     */
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    /**
     * @return the longitude
     */
    public double getLongitude() {
        return longitude;
    }

    /**
     * @param longitude the longitude to set
     */
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the serviceType
     */
    public int getServiceType() {
        return serviceType;
    }

    /**
     * @param serviceType the serviceType to set
     */
    public void setServiceType(int serviceType) {
        this.serviceType = serviceType;
    }

    /**
     * @return the serviceID
     */
    public int getServiceID() {
        return serviceID;
    }

    /**
     * @param serviceID the serviceID to set
     */
    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }
    
}
