<%-- 
    Document   : showInvoice
    Created on : 2012-3-29, 21:22:28
    Author     : mw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Invoice</title>
    </head>
    <body>
        <h1>Invoice</h1>
        
        <div>
            <p>Invoice ID: <s:property value='invoice.invoiceid' /></p>
            <p>Consultation ID: <s:property value='invoice.consultationid' /></p>
            <p>Date(Year-Month-Day): <s:property value='invoice.date' /></p>
            <p>Patient ID: <s:property value='invoice.patientid' /></p>
            <p>Doctor Id: <s:property value='invoice.doctorid' /></p>
            <p>Duration: <s:property value='invoice.duration' />&nbsp;Minutes</p>
            <p>Expense: <s:property value='invoice.expense' /></p>
          
        </div>
    </body>
</html>
