<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
boolean flag=false;
String Name = request.getParameter("uname");
String Pass = request.getParameter("pname");

session.setAttribute("Name", Name);
session.setAttribute("pass", Pass);

if(Name == null || "".equals(Name) || Pass == null || "".equals(Pass)){
	throw new ServletException("Mandatory Parameter missing");
}

String driver = application.getInitParameter("driver");
String con = application.getInitParameter("con");
String DBName = application.getInitParameter("DBName");
String DBPass = application.getInitParameter("DBPass");


Class.forName(driver);
Connection connect = DriverManager.getConnection(con,DBName,DBPass);
Statement s = connect.createStatement();
ResultSet rs = s.executeQuery("select * from JSPTable");
RequestDispatcher r;
while(rs.next())
{
	if(Name.equals(rs.getString(1)) && Pass.equals(rs.getString(2)))
	{
		
		r = request.getRequestDispatcher("/WelcomePage.html");
		r.forward(request, response);
		// out.print("Welcome "+Name); 
		flag=true;
	}
	
}
	if(flag==false)
	{
		r = request.getRequestDispatcher("/Login.html");
		r.forward(request, response);
		
	}

%>



</body>
</html>