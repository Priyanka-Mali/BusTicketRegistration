<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String contact  = request.getParameter("id");
Connection conn;
PreparedStatement pst;
ResultSet rs;

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost/bus_ticket","root","root");
pst = conn.prepareStatement("delete from ticket where id = ?");
 pst.setString(1, contact);
pst.executeUpdate(); 
%>

<script>

alert("Booking Canceled");

</script>

</body>
</html>