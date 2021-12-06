<%@page import="java.util.Vector"%>
<%@page import="model.MemberDao"%>
<%@page import="model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	text-align: center;
}
</style>
</head>
<body>
	<%
	MemberDao dao=new MemberDao();
	Vector<MemberDto> vec=dao.getAllUser();
	pageContext.setAttribute("vec",vec);
%>
	<div align="center">
		<h2>회원 목록</h2>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td style="padding: 20px;">이름</td>
				<td style="padding: 10px;">성별</td>
				<td>이메일</td>
				<td>가입일</td>
				<td>주소</td>
			</tr>
			<c:forEach items="${vec}" var="dto">
				<tr height="40">
					<td width="320"><a href="userInfo.jsp?userid=${dto.userid}"
						style="text-decoration: none"> ${dto.userid} </a></td>
					<td>${dto.username}</td>
					<td><c:if test="${dto.gender eq 'man'}">남성</c:if> <c:if
							test="${dto.gender eq'woman'}">여성</c:if></td>
					<td>${dto.email}</td>
					<td>${dto.jDate}</td>
					<td>${dto.address}</td>
				</tr>
			</c:forEach>
		</table>
		<br> <input type="button" value="메인으로"
			onclick="location.href='main.jsp'">
	</div>
</body>
</html>