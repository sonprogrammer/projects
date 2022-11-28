<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!-- script문장을 실행할수 있도록 해줌 -->
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
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	//로그인이 된 회원은 로그인 정보를 담을 수 있도록 설정한다
	%>
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
					<li><a href="main.jsp"> 메인 </a></li>
					<li class="active"><a href="bbs.jsp"> 게시판 </a></li>
				</ul>
				<%
				if (userID == null) {
					//로그인이 되어있지 않았을 때
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false"> 접속하기 <span class="caret"></span></a> <!-- 임시 주소링크 "#"을 기재 ,caret은 아이콘임-->
						<ul class="dropdown-menu">
							<li class="active"><a href="login.jsp"> 로그인 </a></li>
							<li><a href="join.jsp"> 회원가입 </a></li>
						</ul></li>
				</ul>
				<%
				} else {
				//로그인이 되어있을때
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false"> 회원관리 <span class="caret"></span></a> <!-- 임시 주소링크 "#"을 기재 ,caret은 아이콘임-->
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp"> 로그아웃 </a></li>
						</ul></li>
					<%
					}
					%>
				
			</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table - striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>