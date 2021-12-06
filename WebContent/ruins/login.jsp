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
		<h2>로그인</h2>
		<form action="loginAction.jsp" method="post">
			<table>
				<tr>
					<td colspan="3" align="right"><a href="main.jsp"
						style="text-decoration: none">메인으로</a></td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="userid" required></td>
					<td rowspan="2" align="center"><input type="submit"
						value="로그인" style="width: 60pt;"><br> <input
						type="button" value="회원가입" onclick="location.href='join.jsp'"
						style="width: 60pt;"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pwd" required></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>