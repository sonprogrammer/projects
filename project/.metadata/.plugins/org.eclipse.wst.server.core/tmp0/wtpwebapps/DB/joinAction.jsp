<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트문을 작성하기 위해 사용 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 모든데이터를 utf-8로 받음 -->

<jsp:useBean id="user" class="user.User" scope="page" />
<!-- scope -> 현재의 페이에서만 빈즈 사 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공소프트웨어공학과 자유게시판</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert ('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	//이미 로그인되어 있는 회원가입 페이지에 접속할 수 없게 함 

	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()"); //로그인 페이지로 돌아감
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		/* login 페이지에서 id, password 입력된 값으로 넘어와서 login함수에 넣어서
		실행. -2(오류), -1(아이디가 없), 0(로그인 실패), 1(로그인 성공)이 저장 */

		if (result == -1) { //result = -1 이면 회원가입이안된경우, -1아닌 경우 다 회원가입 상태
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()"); //이전 페이지로 돌아감(join페이지)
			script.println("</script>");
		} else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'"); //회원가입된경우 main.jsp로 이동
			script.println("</script>");
		}
	}
	%>
</body>
</html>