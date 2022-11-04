<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트문을 작성하기 위해 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 모든데이터를 utf-8로 받음 -->

<jsp:useBean id="user" class="user.User" scope="page" />
<!-- scope -> 현재의 페이에서만 빈즈 사 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공소프트웨어공학과 자유게시판</title>
</head>
<body>
	<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getuserID(), user.getuserPassword());
	/* login 페이지에서 id, password 입력된 값으로 넘어와서 login함수에 넣어서
	실행. -2(오류), -1(아이디가 없), 0(로그인 실패), 1(로그인 성공)이 저장 */
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	
	else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()"); //로그인 페이지로 돌아감
		script.println("</script>");
	}
	
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()"); //로그인 페이지로 돌아감
		script.println("</script>");
	}
	
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류 발생!!')");
		script.println("history.back()"); //로그인 페이지로 돌아감
		script.println("</script>");
	}
	%>
</body>
</html>