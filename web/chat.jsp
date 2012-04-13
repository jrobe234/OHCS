<%-- 
    Document   : chat function
    Created on : 2012-2-26, 8:02:00
    Author     : Ben <arkilis@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Consultation page</title>
        <link rel="stylesheet" href="css/style.css" media="all"/>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" >
            
            //register user
            var server = 'http://localhost:9000/OnlineHealthCareSystem/ChatComet?name=${sessionScope.SessionUser.email}';

            var comet = {
                connection   : false,
                iframediv    : false,

                initialize: function() {
                    
                    // debugging by arkilis
                    //alert("start page！");
            
                    // IE
                    if (navigator.appVersion.indexOf("MSIE") != -1) {
                        comet.connection = new ActiveXObject("htmlfile");
                        comet.connection.open();
                        comet.connection.write("<html>");
                        comet.connection.write("<script>document.domain = '"+document.domain+"'");
                        comet.connection.write("</html>");
                        comet.connection.close();
                        comet.iframediv = comet.connection.createElement("div");
                        comet.connection.appendChild(comet.iframediv);
                        comet.connection.parentWindow.comet = comet;
                        comet.iframediv.innerHTML = "<iframe id='comet_iframe' src='"+server+"'></iframe>";

                    } else if (navigator.appVersion.indexOf("KHTML") != -1) {
                        comet.connection = document.createElement('iframe');
                        comet.connection.setAttribute('id',     'comet_iframe');
                        comet.connection.setAttribute('src',    server);
                        with (comet.connection.style) {
                            position   = "absolute";
                            left       = top   = "-100px";
                            height     = width = "1px";
                            visibility = "hidden";
                        }
                        document.body.appendChild(comet.connection);

                    } else {
                        comet.connection = document.createElement('iframe');
                        comet.connection.setAttribute('id','comet_iframe');
                        with (comet.connection.style) {
                            left       = top   = "-100px";
                            height     = width = "1px";
                            visibility = "hidden";
                            display    = 'none';
                        }
                        comet.iframediv = document.createElement('iframe');
                        comet.iframediv.setAttribute('src', server);
                        comet.connection.appendChild(comet.iframediv);
                        document.body.appendChild(comet.connection);
                    }
                },

                // add user
                // 这个 data是从 chatServlet传过来的
                newUser:function(data){
                                        
                    // contain current user
                  
                    var list = document.getElementById('userList');
                    
                    var li = document.createElement('li');
                    li.setAttribute("id","u1"+data);
                    li.innerHTML = data;
                    list.appendChild(li);
                    
                    // user 是下拉列表
                    var user = document.getElementById('user');                  
                    var option = document.createElement('option');
                    
                    window.console.log(data);
                    
                    // make sure youself is not in the list
                    if(data!='${sessionScope.SessionUser.email}'){
                        
                        
                        option.setAttribute("id","u2"+data);
                        // 此处添加 value = 相应的userid 
                        
                        // option.setAttribute("value","u2"+data);
                        
                        option.innerHTML = data;
                        user.appendChild(option);
                    }
                },

                // delete user
                deleteUser:function(data){
                    $('#u1'+data).remove();
                    $('#u2'+data).remove();
                },

                // add public message
                newMessage:function(data){
                    var list = document.getElementById('messageList');
                    var li = document.createElement('li');
                    li.innerHTML = data;

                    list.appendChild(li);
                },

                // add private messgage
                privateMessage:function(data){
                    var list = document.getElementById('privateMessage');
                    var li = document.createElement('li');
                    li.innerHTML = data;
                    window.console.log("private message:" +data);
                    list.appendChild(li);
                },

                // exit
                onUnload: function() {
                    if (comet.connection) {
                        comet.connection = false;
                    }
                }
            }//comet end
			
            if (window.addEventListener) {
                window.addEventListener("load", comet.initialize, false);
                window.addEventListener("unload", comet.onUnload, false);
            } else if (window.attachEvent) {
                window.attachEvent("onload", comet.initialize);
                window.attachEvent("onunload", comet.onUnload);
            }
            
        </script>
        <script type="text/javascript">
            function sendAll(){
                var list = document.getElementById('privateMessage');
                var li = document.createElement('li');
                li.innerHTML = "I said to "+$("#user").val()+": " + $("#message").val();
                list.appendChild(li);
	
                $.ajax({
                    type: "POST",
                    url: "MessageServlet"        , 
                    data: "message="+$("#message").val()+"&user="+$("#user").val()+"&from=${sessionScope.SessionUser.email}"
                });
            }
        </script>
        <script type="text/javascript">
            
            
            var consultid;
            var useridfromemail;
            // Ajax
            function createXMLHttpRequest(){
                if(window.XMLHttpRequest){
                    XMLHttpReq= new XMLHttpRequest();
                } 
                else{
                    if(window.ActiveXObject){
                        try{
					
                            XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                        }
                        catch(e){
                            try{
					
                                XMLHttpReq= new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            catch(e){}
                        }
                    }
                }
            }
	
            function handleResponse(){
	
                if(XMLHttpReq.readyState == 4){
		
                    if(XMLHttpReq.status == 200){

                        var res= XMLHttpReq.responseText;
                        //var response= res.getElementsByTagName("response")[0].firstChild.nodeValue;
                        //document.getElementById("result").innerHTML= response;
                        //
                        //alert("Ajax return: "+ res);
                        //alert(res);
                        consultid= res;
                    }
                }
            }
            
            function sendRequest(url){
		
                createXMLHttpRequest();
                XMLHttpReq.open("GET", url, true);
                XMLHttpReq.onreadystatechange= handleResponse;
		
                XMLHttpReq.send(null);
            }
            
            function handleResponse_Ex(){
	
                if(XMLHttpReq.readyState == 4){
		
                    if(XMLHttpReq.status == 200){

                        var res= XMLHttpReq.responseText;
                        //var response= res.getElementsByTagName("response")[0].firstChild.nodeValue;
                        //document.getElementById("result").innerHTML= response;
                        //
                        //alert("Ajax return: "+ res);
                        //alert(res);
                        useridfromemail= res;
                    }
                }
            }
	
	
            function sendReuqest_Ex(url){
		
                createXMLHttpRequest();
                XMLHttpReq.open("GET", url, true);
                XMLHttpReq.onreadystatechange= handleResponse_Ex;
		
                XMLHttpReq.send(null);
            }
            
            // Ajax functions
            
            function getUserIdFromEmail(email){
                sendReuqest_Ex("GetUserIdFromEmailServlet?email="+email);
                return useridfromemail;
            }
            
            function sendConsultation(){
                
                // get doctor id and patient id
                var onlineDoctors= document.getElementById("user");
                var doctoremail;
                
                for(var i=0; i<onlineDoctors.options.length;i++){
                    var option= onlineDoctors.options[i];
                    if(option.selected){
                        doctoremail=option.value;
                    }
                    
                }
                
                // submit curent chat doctor id and patient id to AddChatConsultServlet
                //alert(doctorid);
                // if current user is a patient
                var doctorid= getUserIdFromEmail(doctoremail);
                alert("You are going to chat with: "+doctoremail);
                sleep(3000);
                sendRequest("AddChatConsultServlet?patientid=${sessionScope.SessionUser.userid}&doctorid="+ useridfromemail);
               
                
            }
            
            function updateConsultation(){
                
                // get doctor id and patient id
                var chatData= document.getElementById("privateMessage").innerHTML;
               
                // submit to AddChatConsultServlet
               
                sendRequest("UpdateChatConsultServlet?consultationid="+consultid+"&content="+chatData);
                
            }
            // end of Ajax functions
            
            // response to consult now button
            function startConsultation(){
                
                // call InsertStartConsultation() to insert a record in consultation
                if(${sessionScope.SessionUser.user_type}==1){
                    // make the "consult now" button disappear and show the chat box
                    document.getElementById('chatbox').style.display='';
                    document.getElementById('consultNow').style.display='none';
                }
                
                if(${sessionScope.SessionUser.user_type}==2){
                    sendConsultation();
                    // make the "consult now" button disappear and show the chat box
                    document.getElementById('chatbox').style.display='';
                    document.getElementById('consultNow').style.display='none';
                }
               
            }
            
            function endConsultation(){
                
                var flag= window.confirm("Are you sure you want to end the consultation now?");
                
                if(flag){
                    
                    // call the updateEndConsultation() to update the record
                    updateConsultation();
                    
                    // close the chat box
                    document.getElementById('chatbox').style.display='none';
                    
                }    
                else{                  
                    // show the "consult now" button
                    return;
                }           
            }
            
            function   sleep(nMillis) 
            { 
                var   dt1   =   new   Date(); 
                for(;;)
                { 
                    var   dt2   =   new  Date(); 
                    if((dt2.getTime()-dt1.getTime())>=nMillis)
                        break;
                } 
            }
        </script>
        <!-- Video chat area -->
        
    </head>
    <body>
        <div id="content" style="height: 1200px">
            <div id="header">
                <div id="title"><h1 id="title">OHCS - Consultation</h1></div>
                <div id="logout"><font id="fullnme">Welcome:${sessionScope.SessionUser.email} </font>| <a href="logout.action">Logout</a></div>

            </div>
            <div id="profile_left">Navigation control panel</div>
            <div id="profile_right">
                <div id="general">
                    <div id="onlineDoctor">
                        Online Doctors: 
                        <select id="user">
                        </select>
                        ${sessionScope.SessionUser.email}
                        <input type="button" value="Consult Now!" id="consultNow" 
                               onclick="javascript: startConsultation();"/>
                    </div>
                    <br />
                    <div id="chatbox" style="display: none;">
                        <div id="privateMessage" style="height:150px;overflow:scroll;border:solid 1px black;"></div>
                        <br />
                        <div id="inputMessage">
                            <input type="text" id="message" style="width: 300px;"/>
                            <input type="button" value="send" onclick="sendAll()" />
                            <input type="button" name="" value="Close" 
                                   onclick="endConsultation();"/>
                            <input type="button" value="Video Chat" onclick="javascript:alert('Coming Soon....');">
                        </div>
                    </div>
                </div>
                <div id="description">
                    <p>Description:</p>
                    <div id="long_des">
                        <s:property value="user.longDescription"></s:property>
                    </div>
                    
                </div>
                <div id="skillareas">
                    <p>My Location</p>
                    <div id="map_canvas" style="width:400px; height: 300px;"></div>

                    <div id="messageList" style="display: none;"></div>
                    <ol id="userList" style="display: none;"></ol>
                </div>
                <div id="history">
                    <p>history info</p>
                </div>
                <div id="awards">
                    <p>awards info</p>
                </div>
            </div>
        </div>
        <!--<div id="footer">Copyright: OHSC. Inc. 2011-2012</div>-->
    </body>
</html>