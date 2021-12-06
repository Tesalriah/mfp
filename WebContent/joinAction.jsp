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
	<jsp:useBean id="dto" class="model.MemberDto">
		<jsp:setProperty property="*" name="dto" />
	</jsp:useBean>
	<%
	String userid=request.getParameter("userid");
	String pwd_check=request.getParameter("pwd_check");
	MemberDao dao=new MemberDao();
	int check=dao.idCheck(userid);
	if(check==1){
%>
	<script type="text/javascript">
			alert("중복된 아이디입니다.")
			history.back()
		</script>
	<%
	}else{
		if(!dto.getPwd().equals(pwd_check)){
%>
	<script type="text/javascript">
				alert("두 비밀번호가 일치하지 않습니다.")
				history.back()
			</script>
	<%
		}
		else{
			int result=dao.join(dto);
			if(result==1){
%>
	<script type="text/javascript">
				location.href="main.jsp"
			</script>
	<%
			}
			else if(result==0){
%>
	<script type="text/javascript">
				alert("회원가입에 실패했습니다.")
				history.back()
			</script>
	<%
			}
		}
	}
%>
</body>
</html>