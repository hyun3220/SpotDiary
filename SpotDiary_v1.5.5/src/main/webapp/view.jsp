<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Welcome To Spot Diary</title>
        <!-- Font Awesome icons (free version)-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet">
        <!-- Fonts CSS-->
        <link rel="stylesheet" href="css/heading.css">
        <link rel="stylesheet" href="css/body.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">

		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
		<script type = "text/javascript"> 
			function openWin(){  
				var _left = Math.ceil(( window.screen.width - 1000 )/2);
		    	var _top = Math.ceil(( window.screen.height - 700 )/2); 
		    	
				window.open("./myDiary.jsp", "_blank", 'width=1030, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, location=no, left = ' + _left + ', top = ' + _top); 
			}  
		</script>    
		<style>
        	body{
        		min-width:560px;
        		padding-left: 30px;
        		padding-right: 30px;
        	}
        	.box {
        		position:relative;
				align-items: center;
				justify-content: center;
				width: 100%;
				height: 100%;
				border: 2px solid #b890f5;
				border-radius: 10px;
			}
			.content {
        		margin: 40px 20px;
			}
			#reFB {
  				display: inline-block;
				background-color: #b991f5;
				text-decoration: none;
			}
			#reFB:hover {
				color: #b991f5;
				background-color: white;
				border-color: #b991f5;
				text-decoration: none;
			}
		</style>
    </head>
    <body id="page-top">
    <%
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('???????????? ?????? ????????????')");
			script.println("location.href = 'freeBoard.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
            <div class="container"><a class="navbar-brand js-scroll-trigger" href="main.jsp"><img class="logo" src="assets/img/logo/logo31.png" alt=""/></a>
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="main.jsp">???</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="freeBoard.jsp">???????????????</a>
                        </li>
                        <%
		    				if(userID != null) {
								PrintWriter script = response.getWriter();
								script.println("<script>");
								script.println("menu.style.display = 'visible'");
								script.println("</script>");
						%>
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onClick = "javascript:openWin();">???????????????</a>
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
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.jsp">?????????</a>
                        </li>
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="joinForm.jsp">????????????</a>
                        </li>
                        <%
    						} else {
    					%>
    					<li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="logoutAction.jsp">????????????</a>
                        </li>
                        <% 
    						}
    					%>
                    </ul>
                </div>
            </div>
        </nav>

		<!-- <section class="page-section freeB" id="freeB"> -->
		<div class="box">
			<div class="content">
		<div class = "container">
	    	<div class = "row">
		  			<table class = "table table-striped" style = "border-collapse: collapse; text-align : center; width: 100%; border : 1px solid #b890f5;">
		  				<thead> <!-- 
		  					<tr>
		  						<th colspan = "3" style = "background-color : #eeeeee; text-align : center;">????????? ??? ??????</th>
		  					</tr> -->
		  					<tr>
		  						<!-- <td style ="width: 20%;">??? ??????</td> -->
		  						<th style = "color: black; font-size: large; border-bottom: 1px solid #b890f5; text-align: center;">
		  						<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></th> 						
		  					</tr>
		  				</thead>
		  				<tbody>
		  					<tr>
		  						<!-- <td >?????????</td> -->
		  						<td style = "text-align: right;"><%= bbs.getUserID() + " | "%>
		  						<!-- <td >????????????</td> -->
		  						<%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + "???" + bbs.getBbsDate().substring(14, 16)  + "???" %></td> 						
		  					</tr>
		  					<tr>
		  						<!-- <td >??????</td> -->
		  						<td style="min-height : 200px; text-align: left;"><%= bbs.getBbsContent() %></td> 						
		  					</tr>
		  				</tbody>
		  			</table>		
			</div>
		  			<%
		  				if(userID != null && userID.equals(bbs.getUserID())){
		  					
		  			%>
		  				<a onclick="return confirm('?????? ???????????????????')"href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-danger pull-right mx-1 mt-2">??????</a>
		  				<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary pull-right mx-1 mt-2">??????</a>	
		  			<%
		  				}
		  			%>
		  			<a href = "freeBoard.jsp" class = "btn pull-left mx-1 mt-2" id="reFB">??????</a>
		</div><br/>
			</div>
		</div>
        <!-- </section> -->

        <!-- Copyright Section-->
        <section class="copyright py-4 text-center text-white">
            <div class="container"><small class="pre-wrap">Copyright ?? Spot Diary 2021</small></div>
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
