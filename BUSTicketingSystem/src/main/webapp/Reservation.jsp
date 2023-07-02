<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Ticket Reservation</title>
<style>
.reg {
	background-image: url("Bus_Banner01.jpg");
	background-position: center;
	background-repeat: repeat;
	background-size: cover;
	position: relative;
	animation: 10s linear infinite marquee;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 5px;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

.container {
	position: absolute;
	right: 0;
	margin: 20px;
	max-width: 300px;
	padding: 16px;
	background-color: white;
	bottom: 240px;
}

@keyframes marquee { 0% {
	background-position: 0
}
100%
{
background-position:-1190px
}
}

.bus1 {
	position: relative;
	width: 40%;
	padding-right: 15px;
	padding-left: 40px;
	padding-top: 200px;
	top: 55px;
}

.bus2 {
	position: relative;
	width: 50%;
	padding-right: 15px;
	padding-left: 470px;
	bottom: 40px;
}

.col-1 {
	flex: 0 0 50%;
	max-width: 50%;
}

.nav1 {
	padding-left:700px;
	margin-right: auto;
	margin-left: auto;
	background-size: cover;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: grey;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
	<div class="nav1">
		<img alt="logo" src="busimage.png" width=100 height=90>
		<div class="nav"></div>
	</div>
</head>
<body>

	<ul>
		<li><a href="aboutus.html">About Us</a>
		<li class="dropdown"><a href="#" class="dropbtn">Contact</a>
			<div class="dropdown-content">
				<a href="#">1800110139</a>
			    <a href="#">bus@irctc.com</a>
			</div>
		</li>
	<!-- 	<li class="dropdown"><a href="#" class="dropbtn">Bus Type</a>
			<div class="dropdown-content">
				<a href="#">Volvo</a>
			    <a href="#">AC</a>
			    <a href="#">NON AC</a>
			</div>
		</li>
		 -->
	</ul>


<div class="reg">
	<div class="col-1 bus1">
		<img alt="image bus" class="img-fluid" height="88" src="Bus1.png" width="219">
	</div>
		
	<div class="col-1 bus2">
		<img alt="image bus" class="img-fluid" height="88" src="Bus2.png" src="Bus2.png" width="219">
	</div>
</div>


	<form action="" class="container">
		<h2>Bus Ticket Reservation</h2>

		Passenger Name : <input type="text" name=name> 
		Contact Number : <input type="text" name=contact><br> <br> 
		<label>From :</label> 
		<select name="from_st">
			<option value="Pune">Pune</option>
		</select> &nbsp;&nbsp; <label>To :</label> <select name="to_st">
			<option value="Kolhapur">Kolhapur(Fare-400)</option>
			<option value="Mumbai">Mumbai(Fare-350)</option>
			<option value="Nagpur">Nagpur (Fare-900)</option>
			<option value="Nashik">Nashik (Fare-300)</option>
		</select> <br> <br> 
		Date : <input type="date" name=date> <br><br> 
		<input type="submit" value="BOOK" name="book">
		&nbsp;&nbsp;&nbsp;
	    <input type="reset" value="CLEAR" name="reset">
	</form>


	<%
	if (request.getParameter("book") != null) {
		Connection conn;
		PreparedStatement pst;
		ResultSet rs;

		//	String id=request.getParameter("id");
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String from_st = request.getParameter("from_st");
		String to_st = request.getParameter("to_st");
		String date = request.getParameter("date");

		try {

			//Class.forName("com.mysql.jdbc.Driver");
			com.mysql.cj.jdbc.Driver d = new com.mysql.cj.jdbc.Driver();
			DriverManager.registerDriver(d);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_ticket","root","root");

			pst = conn.prepareStatement("insert into ticket values('0',?,?,?,?,?)");
			//	pst.setString(1,id);
			pst.setString(1, name);
			pst.setString(2, contact);
			pst.setString(3, from_st);
			pst.setString(4, to_st);
			pst.setString(5, date);

			int val = pst.executeUpdate();
			if (val > 0) {
		out.println("Booking successfull....");
			} else {
		out.println("Booking failed....");
			}

		} catch (Exception ex) {
			out.println(ex);
		}
	}
	%>
	

	<%
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/bus_ticket", "root", "root");

	String query = "select * from ticket";
	Statement st = con.createStatement();

	rs = st.executeQuery(query);

	while (rs.next()) {
		String id = rs.getString("id");
	%>


	<table border="1">
		<tr>
			<th>Id</th>
			<th>Passenger Name</th>
			<th>Contact Number</th>
			<th>From Station</th>
			<th>To Station</th>
			<th>Date</th>
		</tr>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("contact")%></td>
			<td><%=rs.getString("from_st")%></td>
			<td><%=rs.getString("to_st")%></td>
			<td><a href="cancel.jsp?id=<%=id%>">CANCEL</a></td>
		</tr>

	</table>
	<%
	}
	%>

</body>
</html>