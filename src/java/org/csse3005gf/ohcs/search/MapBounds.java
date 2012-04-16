/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.search;

import com.javadocmd.simplelatlng.LatLng;
import com.javadocmd.simplelatlng.LatLngTool;
import com.javadocmd.simplelatlng.util.LengthUnit;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.csse3005gf.ohcs.hibernate.*;

/**
 *
 * @author s4143132
 */

/** to be uncommented once hibernate is understood
public class MapBounds {

    private LatLng northEast;
    private LatLng southWest;
    private LatLng center;
    private int[] serviceTypes;

    public MapBounds(double n, double s, double e, double w, double centerLat, double centerLng, int[] serviceTypes) {
        northEast = new LatLng(n, e);
        southWest = new LatLng(s, w);
        center = new LatLng(centerLat, centerLng);
        this.serviceTypes = serviceTypes;
    }

    public JSONArray getServicesJSON() throws SQLException {
        JSONArray services = new JSONArray();
        
        dbConnect conn = new dbConnect();
        String query = "SELECT * FROM HEALTHCARESERVICES INNER JOIN LOCATION ON HEALTHCARESERVICES.LOCATIONID = LOCATION.LOCATIONID WHERE ";
        
        String filterStr = "(";
        for (int i = 0; i < serviceTypes.length; i++){
            if (filterStr != "(") {
                filterStr += " OR ";
            }
            filterStr += "serviceType = " + serviceTypes[i] + "";
        }
        filterStr += ") AND ";
        query += filterStr;
        query += "latitude < " + this.northEast.getLatitude() + " AND latitude > " + this.southWest.getLatitude() + " AND longitude < " + this.northEast.getLongitude() + " AND longitude > " + this.southWest.getLongitude() + "";
        ResultSet results = conn.executeQuery(query);
        while (results.next()) {
            int locId = results.getInt("LOCATIONID");
            double lat = results.getDouble("LATITUDE");
            double lng = results.getDouble("LONGITUDE");
            String pc = results.getString("POSTCODE");
            int id = results.getInt("healthcareID");
            String name = results.getString("name");
            String phone = results.getString("phone");
            int sType = results.getInt("serviceType");
            String desc = "ADD DESCRIPTION TO DATABASE";
            Eservices service = new EServices(id, lat, lng, name, phone, desc, sType);
            JSONObject JSONservice = service.toJSONObject();
            double dist = LatLngTool.distance(new LatLng(lat, lng), center, LengthUnit.KILOMETER);
            JSONservice.put("dist", dist);
            services.add(JSONservice);
        }
        return services;
    }
}
*/