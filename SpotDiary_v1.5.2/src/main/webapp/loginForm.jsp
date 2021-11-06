<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>로그인 - Spot Diary</title>
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
        </style>
        <!-- Font Awesome icons (free version)-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet">
        <!-- Fonts CSS-->
        <link rel="stylesheet" href="css/heading.css">
        <link rel="stylesheet" href="css/body.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body id="page-top">
    <h1></h1>
        <div class="container" style="text-align: center;">
        <a class="js-scroll-trigger" href="main.jsp"><img class="logo" src="assets/img/logo/logo4.png" alt="" width=450/></a>
        </div><h2></h2>
        <!-- 메뉴탭
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="main.jsp">홈</a>
                        </li>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="freeBoard.jsp">자유게시판</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.jsp">로그인</a>
                        </li>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="joinForm.jsp">회원가입</a>
                        </li>
                    </ul>
                </div>
        </nav> -->
        
<!--  		<section class = "container mt-4" style = "max-width: 560px">
				<form method = "post" action = "loginAction.jsp">
					<div class = "form-group">
						<label>아이디</label>
						<input type = "text" name = "userID" class = "form-control">
					</div>
					<div class = "form-group">
						<label>비밀번호</label>
						<input type = "password" name = "userPW" class = "form-control">
					</div>
					<button type = "submit" class = "btn btn-primary">로그인</button>
					<a href="joinForm.jsp" class="btn btn-primary">회원가입</a>
				</form>
			</section></br>-->	
			
		<div class="box"><div class="content">
		<div class = "login_insert">
		<form method = "post" action = "loginAction.jsp">
			<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td style = "width: 110px;"><h5>아이디</h5></td>
						<td><input class = "form-control" type = "text" id = "userID" name = "userID" maxLength = "20" placeholder = "아이디를 입력해주세요."></td>
					</tr>
					<tr>
						<td style = "width: 110px;"><h5>비밀번호</h5></td>
						<td colspan = "2"><input class = "form-control" type = "password" id = "userPW" name = "userPW" maxLength = "20" placeholder = "비밀번호를 입력해주세요."></td>
					</tr>
					<!-- 
					<tr>		
						<td style = "text-align: left" colspan = "3">
							<input class = "btn btn-primary pull-right mx-1 mt-2" type = "submit" value = "로그인">
						</td>
					</tr>
					-->
				</tbody>
			</table>
			<div class="btn_login_wrap">
				<button type="submit" class="btn btn-info btn-block" id="btnlogin">
					<span class="btn_text">로그인</span>
				</button>		
				<a href="joinForm.jsp" class="btn btn-secondary pull-right mx-1 mt-2">회원가입</a><br/>
				<h2></h2>
			</div>
		</form>
		</div>	
		<h2></h2>
		</div></div>


            <div class="container" style="text-align: center;"><small class="pre-wrap">Copyright © Spot Diary 2021</small></div>

        <!-- Copyright Section-->
       
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