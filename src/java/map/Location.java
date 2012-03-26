/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package map;

import com.javadocmd.simplelatlng.LatLng;
import org.json.simple.JSONObject;

/**
 *
 * @author s4143132
 */
public class Location {
    private int id;
    private LatLng coords;
    private String postcode;
    
    public Location(int id, LatLng coords, String postcode) {
        this.id = id;
        this.coords = coords;
        this.postcode = postcode;
    }
    
    public Location(int id, double lat, double lng, String postcode) {
        this.id = id;
        coords = new LatLng(lat, lng);
        this.postcode = postcode;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the coords
     */
    public LatLng getCoords() {
        return coords;
    }

    /**
     * @param coords the coords to set
     */
    public void setCoords(LatLng coords) {
        this.coords = coords;
    }

    /**
     * @return the postcode
     */
    public String getPostcode() {
        return postcode;
    }

    /**
     * @param postcode the postcode to set
     */
    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }
    
    public JSONObject toJSONObject(){
        JSONObject location = new JSONObject();
        location.put("ID", id);
        location.put("postcode", postcode);
        location.put("latitude", coords.getLatitude());
        location.put("longitude", coords.getLongitude());
        return location;
    }
    
}
