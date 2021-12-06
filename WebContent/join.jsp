<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div align="center">
		<h2>회원가입</h2>
		<form action="joinAction.jsp" method="post">
			<table border="1" width="500">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" maxlength="20" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" maxlength="20" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwd_check" maxlength="20"
						required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" value="man"
						checked="checked">남성 <input type="radio" name="gender"
						value="woman">여성</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" required></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" required></td>
				</tr>
			</table>
			<input type="submit" value="회원가입"> <input type="button"
				value="취소" onclick="history.back()">
		</form>
	</div>
</body>
</html>