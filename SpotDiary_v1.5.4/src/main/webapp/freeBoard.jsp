<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO"%>
<%@ page import = "bbs.Bbs"%>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Welcome To Spot Diary</title>
        <!-- Font Awesome icons (free version)-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet">
        <!-- Fonts CSS-->
        <link rel="stylesheet" href="css/heading.css">
        <link rel="stylesheet" href="css/body.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/slider.css">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
		<script type = "text/javascript">  
			function openWin(){  
				window.open("./jsWindowCtlTest.jsp", "_blank", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, location=no" ); 
			}  
		</script>  
		
    </head>
    <body id="page-top">
    <%
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
            <div class="container"><a class="navbar-brand js-scroll-trigger" href="main.jsp"><img class="logo" src="assets/img/logo/logo31.png" alt=""/></a>
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="main.jsp">홈</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="freeBoard.jsp">자유게시판</a>
                        </li>
                        <%
		    				if(userID != null) {
								PrintWriter script = response.getWriter();
								script.println("<script>");
								script.println("menu.style.display = 'visible'");
								script.println("</script>");
						%>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onClick = "javascript:openWin();">마이페이지</a>
                        </li>
                        <%	
	    					} else {
	    						PrintWriter script = response.getWriter();
	    						script.println("<script>");
	    						script.println("menu.style.display = 'hidden'");
	    						script.println("</script>");
	    					}
       			 	    %>
       			 	    
                 		<%
    						if(userID == null) {
    					%>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.jsp">로그인</a>
                        </li>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="joinForm.jsp">회원가입</a>
                        </li>
                        <%
    						} else {
    					%>
    					<li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="logoutAction.jsp">로그아웃</a>
                        </li>
                        <% 
    						}
    					%>
                    </ul>
                </div>
            </div>
        </nav>

		<!-- <section class="page-section freeB" id="freeB"> -->
	        <div class = "container">
		    	<div class = "row">
		  			<table class = "table table-striped" style = "text-align : center; border : 1px solid #EAEAEA;">
		  				<thead>
		  					<tr>
		  						<th style = "background-color : #EAEAEA; text-align : center;">번호</th>
		  						<th style = "background-color : #EAEAEA; text-align : center;">제목</th>
		  						<th style = "background-color : #EAEAEA; text-align : center;">작성자</th>
		  						<th style = "background-color : #EAEAEA; text-align : center;">작성일</th>
		  					</tr>
		  				</thead>
		  				<tbody>
							<%
								BbsDAO bbsDAO = new BbsDAO();
								ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
								for(int i = 0; i < list.size(); i++){
							%>	
							<tr>
		  						<td><%= list.get(i).getBbsID() %></td>
		  						<td><a href = "view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
		  						<td><%= list.get(i).getUserID() %> </td>
		  						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16)  + "분" %> </td>
		  					</tr>
							<%
								}
							%>
		  				</tbody>
		  			</table>
	  			</div>	  		  			
				<%
					if(pageNumber != 1) {
				%>	
					<a href = "freeBoard.jsp?pageNumber=<%=pageNumber - 1 %>" class=" btn btn-success btn-arraw-left">◀이전</a>
				<% 	
					} if(bbsDAO.nextPage(pageNumber + 1)) {			
				%>
					<a href = "freeBoard.jsp?pageNumber=<%=pageNumber + 1%>" class=" btn btn-success btn-arraw-left">다음▶</a>
				<%
					}					
				%>		
	  			<a href = "write.jsp" class = "btn btn-primary pull-right mx-1 mt-2">글쓰기</a>		  		
	 	 	</div><br/>
        <!-- </section> -->

        <!-- Copyright Section-->
        <section class="copyright py-4 text-center text-black">
            <div class="container"><small class="pre-wrap">Copyright © Spot Diary 2021</small></div>
        </section>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed"><a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a></div>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
