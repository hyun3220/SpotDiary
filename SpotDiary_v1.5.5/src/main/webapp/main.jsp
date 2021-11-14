<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
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
		
		<script type = "text/javascript"> 
			function openWin(){  
				var _left = Math.ceil(( window.screen.width - 1000 )/2);
		    	var _top = Math.ceil(( window.screen.height - 700 )/2); 
		    	
				window.open("./myDiary.jsp", "_blank", 'width=1030, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, location=no, left = ' + _left + ', top = ' + _top); 
			}  
		</script>   
		
		<style type = "text/css">
			a, a:hover {
				color: #000000;
				text-decoration: none;
			}
		</style>
		
	</head>
    <body id="page-top" >
    	<%
			String userID = null;
		
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
		%>
		
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
            <div class="container" ><a class="navbar-brand js-scroll-trigger" href="main.jsp"><img class="logo" src="assets/img/logo/logo3.png" alt=""/></a>
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">홈</a>
                        </li>
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="freeBoard.jsp">자유게시판</a>
                        </li>
                        <%
		    				if(userID != null) {
								PrintWriter script = response.getWriter();
								script.println("<script>");
								script.println("menu.style.display = 'visible'");
								script.println("</script>");
						%>
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onClick = "javascript:openWin();">마이페이지</a>
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
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.jsp">로그인</a>
                        </li>
                        <li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="joinForm.jsp">회원가입</a>
                        </li>
                        <%
    						} else {
    					%>
    					<li class="#"><a style = "color: #747474;" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="logoutAction.jsp">로그아웃</a>
                        </li>
                        <% 
    						}
    					%>
    		
                    </ul>
                </div>
                <form action = "#" method = "get" class = "form-inline my-2 my-lg-0">
					<input type = "text" name = "search" class = "form-control mr-sm-2" type = "search" placeholder = "내용을 입력하세요." aria-label = "search">
				</form>
            </div>
        </nav>
        
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <!-- <img class="masthead-avatar mb-5" src="assets/img/diaryMain3.svg" alt=""> -->
                <!-- Masthead Heading-->
                <h1 class="masthead-heading mb-0" style = "color: #D3CBD5;">Welcome to</h1>
                <img style = "width:800;"class="masthead-avatar mb-5" src="assets/img/logo/logo5.png" >
                <!-- Masthead Subheading-->
                <p class="pre-wrap masthead-subheading font-weight-light mb-0" style = "color:#848484;">Example of Graduation Project</p>
				
                <div id="wrap">
                   
                 <!-- <article> <img class="masthead-avatar mb-5" src="assets/img/mainimage/cafe-2.png"></article>
                <article><img src="assets/img/mainimage/cafe-2.png"></article>
                <article> <img class="masthead-avatar mb-5" src="assets/img/mainimage/cafe-2.png"></article>
                <article><img class="masthead-avatar mb-5" src="assets/img/mainimage/travel-3.png" ></article>
                 <article><img class="masthead-avatar mb-5" src="assets/img/mainimage/travel-3.png" ></article>
                <article> <img class="masthead-avatar mb-5" src="assets/img/mainimage/cafe-3.png"></article>
                 <article> <img class="masthead-avatar mb-5" src="assets/img/mainimage/cafe-3.png"></article>-->
                                
				 <hr color=" #A9A6A9">
				<text1><a href="new.jsp" style = "color: #848484"><b>new ></b></a></text1>
                <article> <a href="main.jsp"><img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (2).png"></a></article>
                <article> <a href="main.jsp"><img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (3).png"></a></article>
                <article> <a href="main.jsp"><img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (4).png"></a></article>
                
                </div>
                
                <div id="wrap">
                 <hr color="#A9A6A9">
                 <text1><a href="hot.jsp" style = "color: #848484;"><b>hot > </b></a> </text1>
                <!--<gr color="black">  -->
                <article> <a href="main.jsp"><img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (8).jpg" ></a></article>
                <article> <a href="main.jsp"><img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (5).jpg" ></a></article>
                <article> <a href="main.jsp"><img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (10).jpg"></a></article>

                <!--  
                <article> <img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (3).jpg"></article>
                <article> <img class="masthead-avatar mb-5" src="assets/img/mainimage/landscape (4).jpg"></article> 
                        
                                        
                -->
             
                </div>
               
              
            </div>
        </header>
        
        
        
        
        
          <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <div class="text-center">
                    <h2 class="page-section-heading text-secondary mb-0 d-inline-block">Sharing to My Spot </h2>
                </div>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light" style = "background-olor: #DB9CFF;">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Items-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal0">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="assets/img/mainimage/diary (1).jpg" alt="Log Cabin"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="assets/img/mainimage/diary (11).png" alt="Tasty Cake"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="assets/img/mainimage/diary (4).jpg" alt="Circus Tent"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="assets/img/mainimage/diary (6).jpg" alt="Controller"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="assets/img/mainimage/diary (8).jpg" alt="Locked Safe"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal5">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div><img class="img-fluid" src="assets/img/mainimage/diary (9).jpg" alt="Submarine"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Portfolio Modal-->
        <div class="portfolio-modal modal fade" id="portfolioModal0" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal0Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">My diary</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <!--  <img class="img-fluid rounded mb-5" src="assets/img/mainimage/diary (1).jpg" alt="Log Cabin"/> -->
                                    <img src="assets/img/mainimage/diary (5).jpg" alt="Log Cabin"/><br/><br/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">내용 테스트 입니다. (DB 연동 전)</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal1Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">Today's Cloud</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/mainimage/diary (2).jpg" alt="Tasty Cake"/><br/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">내용 테스트 입니다. (DB 연동 전)</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal2Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">City</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/mainimage/diary (7).jpg" alt="Circus Tent"/><br/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">내용 테스트 입니다. (DB 연동 전)</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal3Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">Camp</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/mainimage/landscape (12).jpg" alt="Controller"/><br/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">내용 테스트 입니다. (DB 연동 전)</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal4Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">My Painting</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/mainimage/diary (3).jpg" alt="Locked Safe"/><br/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">내용 테스트 입니다. (DB 연동 전)</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal5Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary mb-0">Disney world</h2>
                                    <!-- Icon Divider-->
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="assets/img/mainimage/landscape (7).jpg" alt="Submarine"/><br/>
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-5">내용 테스트 입니다. (DB 연동 전)</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
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
        
