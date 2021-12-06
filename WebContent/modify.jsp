<%@page import="model.MemberDto"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	padding: 15px;
	text-align: center;
}
</style>
</head>
<body>
	<%
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getOneUser(userid);
	
	if(!dto.getPwd().equals(pwd)){
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다")
		history.back()
	</script>
	<%
	}
	
	pageContext.setAttribute("dto", dto);
%>
	<div align="center">
		<h2>회원정보수정</h2>
		<form action="modifyAction.jsp" method="post">
			<table border="1" width="500">
				<tr>
					<td>아이디</td>
					<td>${dto.userid }</td>
				</tr>
				<tr>
					<td>변경할 비밀번호</td>
					<td><input type="password" name="pwd" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwd_check" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${dto.username }</td>
				</tr>
				<tr>
					<td>성별</td>
					<td><c:if test="${dto.gender eq 'man' }">
							<input type="radio" name="gender" value="man" checked="checked"
								onclick="return(false)">남성
							<input type="radio" name="gender" value="woman"
								onclick="return(false)">여성
						</c:if> <c:if test="${dto.gender eq 'woman' }">
							<input type="radio" name="gender" value="man"
								onclick="return(false)">남성
							<input type="radio" name="gender" value="woman" checked="checked"
								onclick="return(false)">여성
						</c:if></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${dto.email }"
						required></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="${dto.address }"
						required></td>
				</tr>
			</table>
			<input type="hidden" name="userid" value="${dto.userid}"> <input
				type="submit" value="수정"> <input type="button" value="취소"
				onclick="history.back()">
		</form>
	</div>
</body>
</html>