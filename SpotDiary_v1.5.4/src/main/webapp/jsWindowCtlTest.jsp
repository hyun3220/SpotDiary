<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 윈도우 창 크기 테스트 화면 </title> 
</head>
<body>
	<%
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원만 접속이 가능합니다.')");
			script.println("window.open('about:blank','_self').self.close();");
			script.println("</script>");
		}
	%>
	마이페이지 새 창 띄우기 테스트
</body>

</html>
