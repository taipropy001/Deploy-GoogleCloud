<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CLOUD COMPUTING 2018 | GROUP 2</title>
<link href="css/content.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
	<div style="background-color: #f1f1f1">
		<div class="container" style="background-color: white">
			<!-- jbt -->
			<div class="text-center" style="background: white;">
				<img src="https://drive.google.com/uc?id=1M5q6dMZ5zsSZNW_FqMPJtGfx3JyIt4xW" 
					width="100%" alt="Error image" title="CLOUD-COMPUTING 2018">
				<hr>
			</div>
			<!-- end jbt -->
			
			
			<!-- wrap -->
			<div class="container-fluid">
	
				<div id="carousel-id" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-id" data-slide-to="0" class=""></li>
						<li data-target="#carousel-id" data-slide-to="1" class=""></li>
						<li data-target="#carousel-id" data-slide-to="2" class="active"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item">
							<img
								alt="First slide"
								src="https://drive.google.com/uc?id=1tRPYFERCWQXWMSMGyqOaaZwHeayE1Lk-"
								style="height: 350px; width: 100%;">
						</div>
						<div class="item">
							<img
								alt="Second slide"
								src="https://drive.google.com/uc?id=1G5sTDSPpYfSgzyZWpPx7_ebyH76mxCmd"
								style="height: 350px; width:  100%;">
						</div>
						<div class="item active">
							<img
								alt="Third slide"
								src="https://drive.google.com/uc?id=1xskaGXu2Qlywk0btcYQmyxcUcRDstMRA"
								style="height: 350px; width:  100%;">
							
						</div>
					</div>
	
					<a class="left carousel-control" href="#carousel-id" role="button" style="background:none !important"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-id" role="button" style="background:none !important"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
	
				<!-- nav -->
				<br>
				<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse"
								data-target=".navbar-ex1-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/" title="Home"><span
								class="glyphicon glyphicon-home"></span> <b>HOME</b></a>
						</div>
	
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse navbar-ex1-collapse">
							<ul class="nav navbar-nav">
								<li><a href="about?id=2">ABOUT</a></li>
								<li><a href="listdata?type=2">LESSON</a></li>
								<li><a href="listdata?type=1">FILE</a></li>
								<li><a href="about?id=3">TEACHER</a></li>
								<li><a href="about?id=4">STUDENT</a></li>
								</li>
								<li><a href="about?id=5">CONTACT</a>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Search">
									</div>
								</form>
	
								<li><a href="login"><i><span
											class="glyphicon glyphicon-user"></span> Login</i></a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
				</nav>
				<p>&nbsp</p>
				<!-- end nav-->
	
				<div class="row">
					<!-- content -->
					<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
						<c:choose>
							
							<c:when test="${mode == 'MODE_HOME' }">
								<div class="alert alert-info" role="alert">
									${webpage.webcontent}
			
								</div>
							</c:when>
							
							<c:when test="${mode == 'MODE_VIEW' }">
								<div class="alert alert-info" role="alert">
									${webpage.webcontent}
								</div>
							</c:when>
							
							<c:when test="${mode == 'MODE_LIST' }">
								<c:forEach items="${ldocument}" var="list">
								<c:if test="${list.type == type}">
									<div class="panel panel-default">
									<div class="panel-body">
									<div class="col-md-2 col-sm-2 col-xs-12">
										<a href="Content?id=${list.idn}"><img
											src="${list.image }" class="img-thumbnail"
											alt="Responsive image"></img></a>
									</div>
									<div class="col-md-9 col-sm-9 col-xs-12">
										<a href="content?id=${list.idn }&type=${list.type}">
											<h5><span style="color: blue">${list.title }</span></h5>
											<h6><i>Time: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.dateCreated }" /></i></h6>
										</a>
									</div>
									</div>
									</div>
								</c:if>
								</c:forEach>
	
							</c:when>
							
							<c:when test="${mode == 'MODE_CONT'}">
								<div class="alert alert-warning" role="alert">
									<c:if test="${tp == 2 }">
										${contentPage.content}
									</c:if>
									
									<c:if test="${tp == 1 }">
										<h3>FILE: ${contentPage.title}</h3>
										You can dowload the file <a href="${contentPage.content}">here</a>
									</c:if>
								</div>
							</c:when>
							
							<c:when test="${mode == 'MODE_LOG'}">
								<div class="panel panel-default">
								<div class="panel-body">
									<h1 class="set-font">LOGGIN TO ADMIN PAGE</h1>
									<br>
									<form class="form-horizontal" method="POST" action="check-login">
										<div class="form-group">
											<label class="control-label col-md-2">Username</label>
											<div class="col-md-10">
												<input type="text" name="idu" class="form-control" value="${acc.idu }" />
											</div>
										</div>
		
										<div class="form-group">
											<label class="control-label col-md-2">Password</label>
											<div class="col-md-10">
												<input type="password" name="pass" class="form-control" value="${acc.pass }"/>
											</div>
										</div>
										
										<c:if test="${err =='ERR_USER'}">
											<center>
											<p style="color: red">
												Username doesn't exist <span class="glyphicon glyphicon-remove"></span>
											</p>
											</center>
										</c:if>
										<c:if test="${err =='ERR_PASS'}">
										<center>
											<p style="color: red">
												Incorrect password <span class="glyphicon glyphicon-remove"></span>
											</p>
											</center>
										</c:if>
										<c:if test="${err =='ERR_NULL'}">null</c:if>

										<div class="form-group">
											<center><input type="submit" class="btn btn-primary" value="Login" /></center>
										</div>
									</form>
								</div>
								</div>
								
							
							</c:when>
							
						</c:choose>
					</div>
					<!-- end content -->
	
					<!-- slide -->
					<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
						
						<div class="sideright">
						<div class="sideLabel">
					        <h2>Lecture Dates</h2>   </div>    
					        <div class="sideInformation">
					            <ul>
									<c:forEach items="${slidelist}" var="slide">
										<li>
											<a href="content?id=${slide.idn }&type=${slide.type }">
												<i>Time: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${slide.dateCreated }" /></i><br>
												${slide.title }
											</a>
										</li>
									</c:forEach>
					            </ul>					
					        </div>
					    </div>
					    
					    <hr>
						
						<div class="fb-page" data-href="https://www.facebook.com/tuyensinhspkttphcm/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
							<blockquote cite="https://www.facebook.com/tuyensinhspkttphcm/" class="fb-xfbml-parse-ignore">
								<a href="https://www.facebook.com/tuyensinhspkttphcm/"></a>
							</blockquote>
						</div>	
					</div>
					
					<!-- end slide -->
				</div>
			</div>
			<!-- end wrap -->
			
		<!-- footer -->
		<hr>
		<div style="background-color: black">
			<p style="color: white;font-family: Tahoma,Geneva,sans-serif;">
				<t>4th International Conference on Green Technology and Sustainable
				Development <br> HCMC University of Technology and Education <br>
				Add: No 1 Vo Van Ngan Street, Linh Chieu Ward, Thu Duc District, Ho
				Chi Minh City <br> Tel: (+84.8) 37 221 223 - Ext: 8161 or 8443
				<br> E-mail: gtsd2018@hcmute.edu.vn <br>
			</p>
		</div>
		<!-- endfooter -->
	
		</div>
		

			
	</div>
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12';
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>