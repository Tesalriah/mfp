<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String username=request.getParameter("username");
	
	MemberDao dao=new MemberDao();
	int result=dao.login(userid, pwd);
	
	if(result==1){
		session.setAttribute("userid", userid);
		session.setAttribute("username", username);
%>
	<script type="text/javascript">
			location.href="main.jsp"
		</script>
	<%
	}
	else if(result==0){
%>
	<script type="text/javascript">
			alert("비밀번호가 틀렸습니다.")
			history.back()
		</script>
	<%
	}
	else if(result==-1){
%>
	<script type="text/javascript">
			alert("존재하지 않는 아이디입니다.")
			history.back()
		</script>
	<%
	}
	else if(result==-2){
%>
	<script type="text/javascript">
			alert("데이터베이스 오류가 발생했습니다.")
			history.back()
		</script>
	<%
	}
%>
</body>
</html>