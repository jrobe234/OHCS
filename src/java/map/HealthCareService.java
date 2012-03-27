/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package map;

import org.json.simple.JSONObject;

/**
 *
 * @author s4143132
 */
public class HealthCareService {
    private int id;
    private Location location;
    private String name;
    private String phone;
    private String desc;
    private int serviceType;
    
    public HealthCareService(int ident, Location loc, String nme, String ph, String dsc, int sType){
        id = ident;
        location = loc;
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
     * @return the location
     */
    public Location getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(Location location) {
        this.location = location;
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
        jsonHCS.put("location", location.toJSONObject());
        jsonHCS.put("desc", desc);
        jsonHCS.put("serviceType", serviceType);
        return jsonHCS;
    }
    
}
