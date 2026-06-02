<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>랩원 등록</title>
</head>

<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">랩원 등록</h1>
		</div>
	</div>

	<div class="container">

		<form name="newMember"
			action="${pageContext.request.contextPath}/labcontrol?action=processAddMember"
			class="form-horizontal"
			method="post"
			enctype="multipart/form-data">

			<div class="form-group row">
				<label class="col-sm-2">학번</label>
				<div class="col-sm-3">
					<input type="text" name="studentId" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">학년</label>
				<div class="col-sm-3">
					<input type="text" name="grade" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">전공</label>
				<div class="col-sm-3">
					<input type="text" name="major" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">역할</label>
				<div class="col-sm-3">
					<select name="role" class="form-control">
						<option value="랩장">랩장</option>
						<option value="부랩장">부랩장</option>
						<option value="랩원">랩원</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="status" value="재학"> 재학
					<input type="radio" name="status" value="휴학"> 휴학
					<input type="radio" name="status" value="졸업"> 졸업
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">프로필 사진</label>
				<div class="col-sm-3">
					<input type="file" name="file" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-5">
					<input type="email" name="email" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>

		</form>
	</div>

</body>
</html>