<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background:lightgray;">
<center>
<% 
String Name = ""+session.getAttribute("Name");
session.getAttribute("Pass");
out.print("<center><p style='color:red'><b>You are gonna be logged out <p style='color:Green;font-size:25px;'>"+Name+"</p></b></p></center> ");

session.invalidate(); 
%>
</center>

<center><H1><font style="color:red;">Successfully Logged Out</font></H1>
<br>
Click to go back to <a href="Home.html">Home Page</a></center>
</body>
</html>