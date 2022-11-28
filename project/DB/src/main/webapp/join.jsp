<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device - width" , initial-scale="1">
<link rel="stylesheet" href=" css/bootstrap.css">
<link rel="stylesheet" href=" css/custom.css">

<title>항공소프트웨어공학과 자유게시판</title>
</head>
<body style="background-color: lightblue;">
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<!--class="navbar-toggle collapsed"=> 네비게이션의 화면 출력유무,  
				data-toggle="collapse"=>모바일 상태에서 클릭하면서 메뉴가 나오게 설정 -->
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
					<!-- 아이콘 이미지 -->
				</button>
				<a class="navbar-brand" href="main.jsp">항소 게시판</a>
				<!-- 기본 메뉴바 -->
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp"> 메뉴 </a></li>
					<li class = "active "><a href="bbs.jsp"> 게시판 </a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 접속하기 <span class="caret"></span></a> <!-- 임시 주소링크 "#"을 기재 ,caret은 아이콘임-->
						<ul class="dropdown-menu">
							<li ><a href="login.jsp"> 로그인 </a></li>
							<li class="active"><a href="join.jsp"> 회원가입 </a></li>
						</ul></li>
				</ul>
			</div>
	</nav>
	<div class="container">
		<!-- 전체 레이아웃 감싸주는것 -->
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">

			<form method="post" action="joinAction.jsp">
				<!-- form 태그란 데이터를 서버에 보내기 위해 사용하는 모든 대화형 컨트롤이다 -->
				<img alt="그림없음" src="Circle.png">
				<!-- img삽입 하는 곳 -->
				<h2 style="text-align: center;">회원가입 화면</h2>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
					<!-- input은 화면에 표시되지 않지만 서버로 데이터를 전송해야하는 경우 사용한다 -->
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="userName" maxlength="20">
					<!-- input은 화면에 표시되지 않지만 서버로 데이터를 전송해야하는 경우 사용한다 -->
				</div>

				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active"> <input type="radio"
							name="userGender" autocomplete="off" value="남자" checked>남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="userGender" autocomplete="off" value="여자" checked>여자
						</label>
					</div>
					<!-- input은 화면에 표시되지 않지만 서버로 데이터를 전송해야하는 경우 사용한다 -->
				</div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일"
						name="userEmail" maxlength="50">
					<!-- input은 화면에 표시되지 않지만 서버로 데이터를 전송해야하는 경우 사용한다 -->
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="회원가입"> <img src="JJWORLD.png">
				<!-- img 삽입 하는 곳 -->
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>