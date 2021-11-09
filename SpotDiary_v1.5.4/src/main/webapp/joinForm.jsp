<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>회원가입 - Spot Diary</title>
        <style>
        	body{
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
        		margin: 20px 10px;
			}
        </style>
        <!-- Font Awesome icons (free version)-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="css/styles.css" >
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/custom.css">
        <script src = "https://code.jquery.com/jquery-3.1.1.min.js"> </script>
        <script src = "js/bootstrap.js"></script>
        <script type = "text/javascript">
        	function registerCheckFunction() {
        		var userID = $('#userID').val();
        		$.ajax({
        			type: 'POST',
        			url: './UserRegisterCheckServlet',
        			data: {userID: userID},
        			success: function(result) {
        				if(result == 1) {
        					$('#checkMessage').html(' ※ 사용할 수 있는 아이디입니다.');
        					$('#checkType').attr('class', 'modal-content panel-success');
        				}
        				else {
        					$('#checkMessage').html(' ※ 이미 사용중인 아이디입니다.');
        					$('#checkType').attr('class', 'modal-content panel-warning');
        				}
        				$('#checkModal').modal("show");
        			}
        		});
        	};
        	function passwordCheckFunction() {
        		var userPW1 = $('#userPW1').val();
        		var userPW2 = $('#userPW2').val();
				if(userPW1 != userPW2) {
					$('#passwordCheckMessage2').html('');
					$('#passwordCheckMessage').html(' ※ 비밀번호가 일치하지 않습니다.');
				}
				else {
					$('#passwordCheckMessage').html('');
					$('#passwordCheckMessage2').html(' ※ 비밀번호가 일치합니다.');
				}
        	};
        </script>
    </head>
    <body id="page-top">
    <h1></h1>
        <div class="container" style="text-align: center;">
        <a class="js-scroll-trigger" href="main.jsp"><img class="logo" src="assets/img/logo/logo4.png" alt="" width=450/></a>
        </div><h2></h2>
        <!-- 메뉴탭
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
            <div class="container"><a class="navbar-brand js-scroll-trigger" href="main.jsp"><img class="logo" src="assets/img/logo/logo31.png" alt=""/></a>
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="main.jsp">홈</a>
                        </li>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="freeBoard.jsp">자유게시판</a>
                        </li>
                        <li class="#"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.jsp">로그인</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="joinForm.jsp">회원가입</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> -->
        
    <div class="box"><div class="content">
	<div class = "container">
		<form method = "post" action = "./userRegister">
			<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
				<thead>
					<!-- <tr>
						<th colspan = "3" style = "text-align: center;"><h4>회원등록</h4></th>
					</tr> -->
				</thead>
				<tbody>
					<tr>
						<td style = "width: 120px;"><h5>* 아이디</h5></td>
						<td><input class = "form-control" type = "text" id = "userID" name = "userID" maxLength = "20" placeholder = "아이디를 입력해주세요."></td>
						<td style = "width: 110px;"><button class = "btn btn-primary" onclick ="registerCheckFunction();" type = "button"> 중복확인 </button></td>
					</tr>
					<tr>
						<td style = "width: 120px;"><h5>* 비밀번호</h5></td>
						<td colspan = "2"><input class = "form-control" type = "password" onkeyup = "passwordCheckFunction();" id = "userPW1" name = "userPW1" maxLength = "20" placeholder = "비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td style = "width: 120px;"><h5>* 비밀번호 확인</h5></td>
						<td colspan = "2"><input class = "form-control" type = "password" onkeyup = "passwordCheckFunction();" id = "userPW2" name = "userPW2" maxLength = "20" placeholder = "비밀번호를 다시 입력해주세요."></td>
					</tr>
					<tr>
						<td style = "width: 120px;"><h5>* 이름</h5></td>
						<td colspan = "2"><input class = "form-control" type = "text" id = "userName" name = "userName" maxLength = "20" placeholder = "이름을 입력해주세요."></td>
					</tr>
					<tr>
						<td style = "width: 120px;"><h5>나이</h5></td>
						<td colspan = "2"><input class = "form-control" type = "text" id = "userAge" name = "userAge" maxLength = "20" placeholder = "나이를 입력해주세요."></td>
					</tr>
					<tr>
						<td style = "width: 120px;"><h5>성별</h5></td>
						<td colspan = "2">
							<div class = "form-group" style = "text-align: center; margin: 0 auto;">
								<div class = "btn-group" data-toggle = "buttons">
									<label class = "btn btn-primary active">
										<input type = "radio" name = "userGender" autocomplete = "off" value = "남자" checked>남자
									</label>
									<label class = "btn btn-primary">
										<input type = "radio" name = "userGender" autocomplete = "off" value = "여자">여자
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style = "width: 110px;"><h5>* 이메일</h5></td>
						<td colspan = "2"><input class = "form-control" type = "Email" id = "userEmail" name = "userEmail" maxLength = "20" placeholder = "이메일을 입력해주세요."></td>
					</tr>
					<!-- 
					<tr>		
						<td style = "text-align: left" colspan = "3"><h5 style = "color: red;" id = "passwordCheckMessage"></h5><h5 style = "color: blue;" id = "passwordCheckMessage2"></h5>
							<a href="main.jsp" class="btn btn-danger pull-right mx-1 mt-2">취소</a>
							<input class = "btn btn-primary pull-right mx-1 mt-2" type = "submit" value = "회원가입">
						</td> 
					</tr> -->
				</tbody>
			</table>
			<div class="btn_join_wrap">
				<button type="submit" class="btn btn-info btn-block" id="btnjoin">
					<span class="btn_text">가입하기</span>
				</button>	
				<h5 style = "color: red;" id = "passwordCheckMessage"></h5><h5 style = "color: blue;" id = "passwordCheckMessage2"></h5>	
				<a href="loginForm.jsp" class="btn btn-secondary pull-right mx-1 mt-2">로그인</a>
			</div>
		</form>
	</div>
		</div></div>
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null) {
			messageContent = (String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null) {
			messageType = (String)session.getAttribute("messageType");
		}
		if(messageContent != null) {
	%>
	<div class="modal fade" id = "messageModal" tabindex = "-1" role = "dialog" aria-hidden = "true">
		<div class = "vertical-alignment-helper">
			<div class = "modal-dialog vertical-align-center">
				<div class = "modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
					<div class = "modal-header panel-heading">
						<button type = "button" class = "close" data-dismiss = "modal">
							<span aria-hidden = "true">&times;</span>
							<span class = "sr-only">Close</span>
						</button>
						<h4 class = "modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class = "modal-body">
						<%= messageContent %>
					</div>
					<div class = "modal-footer">
						<button type = "button" class = "btn btn-primary" data-dimiss = "modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	<div class="modal fade" id = "checkModal" tabindex = "-1" role = "dialog" aria-hidden = "true">
		<div class = "vertical-alignment-helper">
			<div class = "modal-dialog vertical-align-center">
				<div id = "checkType" class = "modal-content panel-info">
					<div class = "modal-header panel-heading">
						<button type = "button" class = "close" data-dismiss = "modal">
							<span aria-hidden = "true">&times;</span>
							<span class = "sr-only">Close</span>
						</button>
						<h4 class = "modal-title">
							확인 메시지
						</h4>
					</div>
					<div class = "modal-body" id = "checkMessage">
					</div>
					<div class = "modal-footer">
						<button type = "button" class = "btn btn-primary" data-dimiss = "modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
		<div class="container" style="text-align: center;"><small class="pre-wrap">Copyright © Spot Diary 2021</small></div>
	
        <!-- Copyright Section-->
       
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->

    </body>
</html>
