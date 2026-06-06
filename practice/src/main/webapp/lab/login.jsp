<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>관리자 로그인</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 로그인</h1>
		</div>
	</div>

	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">관리자 아이디와 비밀번호를 입력하세요.</h5>

			<%
				String loginError = (String) request.getAttribute("loginError");
				if (loginError != null) {
			%>
				<div class="alert alert-danger" role="alert">
					<%=loginError%>
				</div>
			<%
				}
			%>

			<form class="form-signin" action="${pageContext.request.contextPath}/labcontrol?action=processLogin" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">ID</label>
					<input type="text" id="inputUserName" class="form-control" placeholder="ID" name="id" required autofocus>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
				</div>

				<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>
