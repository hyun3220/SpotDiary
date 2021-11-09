<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class = "bbs.Bbs" scope = "page" />
<jsp:setProperty name = "bbs" property="bbsTitle" />
<jsp:setProperty name = "bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" Content="text/html; charset= UTF-8">

<title> 로그인 처리 </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'loginForm.jsp'");
			script.println("</script>");
		} else {
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				 if (result == -1) {
					 PrintWriter script = response.getWriter();
					 script.println("<script>");
					 script.println("alert('글쓰기에 실패했습니다.')");
					 script.println("history.back()");
					 script.println("</script>");
				 }else {
					 PrintWriter script = response.getWriter();
					 script.println("<script>");
					 script.println("alert('게시판에 글이 등록됐습니다.')");
					 script.println("location.href = 'freeBoard.jsp'");
					 script.println("</script>");
				 }
				
			}
		
	
		}
	%>
</body>
</html>