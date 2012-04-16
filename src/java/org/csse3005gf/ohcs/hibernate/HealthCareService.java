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
public class HealthCareService {
    private int id;
    private double latitude;
    private double longitude;
    private String name;
    private String phone;
    private String desc;
    private int serviceType;
    
    public HealthCareService(int ident, double lat,double lng, String nme, String ph, String dsc, int sType){
        id = ident;
        latitude = lat;
        longitude = lng;
        name = nme; 
        phone = ph;
        desc = dsc; 
        serviceType = sType;
    }
    
     /**
     * @return the id
     */
    public int getID() {
        return id;
    }

     /**
     * @return the location
     */
    public void setID(int id) {
        this.id = id;
    }
    
    /**
     * @return the id
     */
    public double getLatitude() {
        return latitude;
    }

     /**
     * @return the location
     */
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }
    
      public double getLongitude() {
        return longitude;
    }

     /**
     * @return the location
     */
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
    
    public JSONObject toJSONObject(){
        JSONObject jsonHCS = new JSONObject();
        jsonHCS.put("ID", id);
        jsonHCS.put("name", name);
        jsonHCS.put("phone", phone);
        jsonHCS.put("latitude", latitude);
        jsonHCS.put("longitude", longitude);
        jsonHCS.put("desc", desc);
        jsonHCS.put("serviceType", serviceType);
        return jsonHCS;
    }
    
}
