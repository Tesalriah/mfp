<%@page import="model.MemberDto"%>
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
	MemberDao dao=new MemberDao();
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String pwd_check=request.getParameter("pwd_check");
	String email=request.getParameter("email");
	String address=request.getParameter("address");
	
	if(!pwd.equals(pwd_check)){
%>
	<script type="text/javascript">
			alert("두 비밀번호가 일치하지 않습니다.")
			history.back()
		</script>
	<%
	}
	int result=dao.updateUser(userid, pwd, email, address);
	if(result < 1){
%>
	<script type="text/javascript">
			alert("수정에 실패했습니다")
			history.back()
		</script>
	<%
	}
	else{
%>
	<script type="text/javascript">
			alert("수정되었습니다")
			location.href="main.jsp"
		</script>
	<%
	}
%>
</body>
</html>