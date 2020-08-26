<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<% 

boolean status;
String Name = request.getParameter("name");
String Pass = request.getParameter("pword");
String Email = request.getParameter("ename");
String Mob = request.getParameter("mname");


String driver = application.getInitParameter("driver");
String con = application.getInitParameter("con");
String DBName = application.getInitParameter("DBName");
String DBPass = application.getInitParameter("DBPass");


Class.forName(driver);
Connection connect = DriverManager.getConnection(con,DBName,DBPass);
PreparedStatement ps = connect.prepareStatement("insert into JSPTable values(?,?,?,?)"); 
ps.setString(1, Name);
ps.setString(2, Pass);
ps.setString(3, Mob);
ps.setString(4, Email);
status=ps.execute();
status = true;

RequestDispatcher r;
	if(status == true)		
	{
		out.print("Registered Successfully !");
		r = request.getRequestDispatcher("/Login.html");
		r.include(request, response);
		out.print("Registered Successfully !");
	}
	connect.close();
	
%>

</body>
</html>