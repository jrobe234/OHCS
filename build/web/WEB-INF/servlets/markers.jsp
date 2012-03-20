<%@page import="java.sql.*"%>
<%@page import="utilities.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.simple.*"%>
<%
        String north = request.getParameter("north").toString();
        String south = request.getParameter("south").toString();
        String east = request.getParameter("east").toString();
        String west = request.getParameter("west").toString();
        Double centerLat = Double.parseDouble(request.getParameter("centerLat"));
        Double centerLng = Double.parseDouble(request.getParameter("centerLng"));

        if (north != null && south != null && east != null && west != null) {
            JSONObject obj = new JSONObject();
            JSONArray markers = new JSONArray();
            JSONObject marker;

            dbConnect conn = new dbConnect();

            String query = "SELECT * FROM HEALTHCARESERVICES INNER JOIN LOCATION ON HEALTHCARESERVICES.LOCATIONID = LOCATION.LOCATIONID WHERE ";

            query += "latitude < " + north + " AND latitude > " + south + " AND longitude < " + east + " AND longitude > " + west + "";

            ResultSet results = conn.executeQuery(query);
            while (results.next()) {
                
                double lat = results.getDouble("LATITUDE");
                double lng = results.getDouble("LONGITUDE");
                marker = new JSONObject();
                marker.put("ID", results.getString("healthcareID"));
                marker.put("name", results.getString("name"));
                marker.put("phone", results.getString("phone"));
                marker.put("longitude", lng);
                marker.put("latitude", lat);
                marker.put("dist", distFrom(centerLat, centerLng, lat, lng ));
                markers.add(marker);
            }


            obj.put("markers", markers);
            response.setContentType("application/json");
            response.getWriter().write(obj.toString());
        }


%>

<%!
    private double distFrom(double lat1, double lng1, double lat2, double lng2) {
        double earthRadius = 3958.75;
        double dLat = Math.toRadians(lat2 - lat1);
        double dLng = Math.toRadians(lng2 - lng1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLng / 2) * Math.sin(dLng / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return Math.abs(earthRadius * c);
    }

%>