<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 다이어리</title>
<link rel="stylesheet" href="css/myDiary.css" >
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		String userName = null;
		if (session.getAttribute("userName") != null) {
			userName = (String) session.getAttribute("userName");
		}

	%>
	
<img style = "height: 150px;" id = "logo" src="assets/img/logo/logo5.png" >
<div>
	<div id = "s_left">
		<div id = "myProfile">
			<img id = "image-thumbnail" src = "assets/img/sample.jpg">
		</div>	
		<div id = "userBox">
			<b><%= userName %></b> 접속중<p>
			<a href = "#.jsp" style = "text-decoration: none">
				<img style = "width: 25px; height: 25px;" src = "assets/img/myDiary/p_pencil.png" hspace = "3">
			</a>
			<a href = "#.jsp" style = "text-decoration: none">
				<img style = "width: 25px; height: 25px;" src = "assets/img/myDiary/p_star.png" hspace = "3">
			</a>
			<a href = "#.jsp" style = "text-decoration: none">
				<img style = "width: 25px; height: 25px;" src = "assets/img/myDiary/p_gear.png">
			</a>
		</div>
	</div>
	
	<div id = "contents">
		&nbsp;&nbsp;<b>Category</b><a href = "#.jsp" style = "text-decoration: none"> ></a><br>
		&nbsp;&nbsp;&nbsp; - <a href = "#.jsp" style = "text-decoration: none">menu1</a><br>
		&nbsp;&nbsp;&nbsp; - <a href = "#.jsp" style = "text-decoration: none">menu2</a><br>
		&nbsp;&nbsp;&nbsp; - <a href = "#.jsp" style = "text-decoration: none">menu3</a><br>
		&nbsp;&nbsp;&nbsp; - <a href = "#.jsp" style = "text-decoration: none">menu4</a><br>
		&nbsp;&nbsp;&nbsp; - <a href = "#.jsp" style = "text-decoration: none">menu5</a><br>
	</div>
	<div id = "img">
	
	</div>
	<div id = "img">
	
	</div>
	<div id = "img">
	
	</div>
</div>


</body>
</html>
