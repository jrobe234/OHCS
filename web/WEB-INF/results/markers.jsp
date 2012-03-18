<%@page import="java.sql.*"%>
<%@page import="utilities.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.simple.*"%>
<%
    String north = request.getParameter("north").toString();
    String south = request.getParameter("south").toString();
    String east = request.getParameter("east").toString();
    String west = request.getParameter("west").toString();
    if (north != null && south != null && east != null && west != null) {
        JSONObject obj = new JSONObject();
        JSONArray markers = new JSONArray();
        JSONObject marker;

        dbConnect conn = new dbConnect();
        String query = "SELECT * FROM healthcareServices INNER JOIN location ON healthcareServices.locationID = location.locationID WHERE ";

        query += "latitude < " + north + " AND latitude > " + south + " AND longitude < " + east + " AND longitude > " + west + ";";
        ResultSet results = conn.executeQuery(query);
        while (results.next()) {
            marker = new JSONObject();
            marker.put("ID", results.getString("healthcareID"));
            marker.put("name", results.getString("name"));
            marker.put("phone", results.getString("phone"));
            marker.put("longitude", results.getString("longitude"));
            marker.put("latitude", results.getString("latitude"));
            markers.add(marker);
        }
        obj.put("markers", markers);
        response.setContentType("application/json");
        response.getWriter().write(obj.toString());
    }

%>