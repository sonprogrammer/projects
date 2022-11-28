<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트문을 작성하기 위해 사용 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 모든데이터를 utf-8로 받음 -->

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />  
<!-- #@!$#!$@#!$!#@!@#$id랑 class에 들어가는게 디비에 있는건지 아님 클래스 명인지 보기 -->
<!-- scope -> 현재의 페이에서만 빈즈 사 -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />


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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	else{
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null)
			//제목이나 내용을 입력하지 않은경우는 오류발생
			{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("<alert('제목이나 내용을 확인하세요!')");
			script.println("history.back()");
			script.println("</script>");
			}
		else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			
			if(result == -1){ //데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
				//DB를 생성할때 PRIMARY값으로 userID를 주었기 때문에, 동일한 아이뒤는 생성불가
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bbs.jsp'");	//회원가입이 된경우 => main.jsp로 이동
				script.println("</script>");
			}
		}
	}
		
	%>
</body>
</html>