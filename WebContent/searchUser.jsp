<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>회원 찾기</h2>
		<form action="userInfo.jsp" method="post">
			<table>
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="userid" required></td>
				</tr>
			</table>
			<input type="submit" value="찾기"> <input type="button"
				value="메인으로" onclick="history.back()">
		</form>
	</div>
</body>
</html>