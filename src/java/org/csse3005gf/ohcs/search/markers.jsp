<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="map.*"%>
<%@page import="org.json.simple.*"%>
<%
        Double north = Double.parseDouble(request.getParameter("north"));
        Double south = Double.parseDouble(request.getParameter("south"));
        Double east = Double.parseDouble(request.getParameter("east"));
        Double west = Double.parseDouble(request.getParameter("west"));
        Double centerLat = Double.parseDouble(request.getParameter("centerLat"));
        Double centerLng = Double.parseDouble(request.getParameter("centerLng"));
        String[] filters = request.getParameterValues("filters[]");

        if (north != null && south != null && east != null && west != null && centerLat != null && centerLng != null) {
            JSONObject obj = new JSONObject();
            JSONArray markers = new JSONArray();
            int[] filter = new int[filters.length];
            for (int j = 0; j < filters.length; j++){
                filter[j] = Integer.parseInt(filters[j]);
            }
            
            MapBounds myMap = new MapBounds(north, south, east, west, centerLat, centerLng, filter);
            
            markers = myMap.getServicesJSON();

            obj.put("markers", markers);
            response.setContentType("application/json");
            response.getWriter().write(obj.toString());
        } 
%>