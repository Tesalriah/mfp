<%@page import="model.MemberDto"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
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
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getOneUser(userid);
	String check=dto.getPwd();
	
	if(!check.equals(pwd)){
%>
	<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다")
			history.back()
		</script>
	<%
	}else{
		int result=dao.deleteUser(userid, pwd);
		if(result<1){
%>
	<script type="text/javascript">
				alert("삭제에 실패했습니다")
				history.back()
			</script>
	<%
		}
		else{
%>
	<script type="text/javascript">
				alert("회원정보를 삭제했습니다")
				location.href="main.jsp"
			</script>
	<%
		}
	}
%>
</body>
</html>