<%@page import="model.MemberDto"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	MemberDao dao=new MemberDao();
	int result=dao.idCheck(userid);
	
	if(result<1){
%>
	<script type="text/javascript">
			alert("아이디가 존재하지 않습니다.")
			history.back()
		</script>
	<%
	}
	MemberDto dto=null;
	dto=dao.getOneUser(userid);
	session.setAttribute("dto", dto);
%>
	<div align="center">
		<h2 style="color: red;">회원삭제</h2>
		<form action="deleteAction.jsp" method="post">
			<table border="1" width="500">
				<tr>
					<td>아이디</td>
					<td>${dto.userid }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${dto.username }</td>
				</tr>
				<tr>
					<td>성별</td>
					<td><c:if test="${dto.gender eq 'man' }">
					남성
					</c:if> <c:if test="${dto.gender eq 'woman' }">
					여성
					</c:if></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${dto.email }</td>
				</tr>
				<tr>
					<td>가입날짜</td>
					<td>${dto.jDate }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${dto.address }</td>
				</tr>
			</table>
			<br> <input type="hidden" name="userid" value="${dto.userid }">
			<input type="submit" value="회원삭제"> <input type="button"
				value="메인으로" onclick="location.href='main.jsp'">
		</form>
	</div>
</body>
</html>