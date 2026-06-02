<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>랩원 정보 수정</title>
</head>

<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">랩원 정보 수정</h1>
			<p class="lead">랩원의 인적사항을 수정할 수 있습니다.</p>
		</div>
	</div>

	<div class="container">

		<form name="updateMember"
			action="${pageContext.request.contextPath}/labcontrol?action=processUpdateMember"
			method="post" enctype="multipart/form-data">

			<div class="form-group row">
				<label class="col-sm-2">학번</label>
				<div class="col-sm-5">
					<input type="text" name="studentId" class="form-control"
						value="${m.studentId}" readonly>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-5">
					<input type="text" name="name" class="form-control"
						value="${m.name}">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">학년</label>
				<div class="col-sm-5">
					<select name="grade" class="form-control">
						<option value="1" ${m.grade == 1 ? 'selected' : ''}>1학년</option>
						<option value="2" ${m.grade == 2 ? 'selected' : ''}>2학년</option>
						<option value="3" ${m.grade == 3 ? 'selected' : ''}>3학년</option>
						<option value="4" ${m.grade == 4 ? 'selected' : ''}>4학년</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">전공</label>
				<div class="col-sm-5">
					<input type="text" name="major" class="form-control"
						value="${m.major}">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">역할</label>
				<div class="col-sm-5">
					<select name="role" class="form-control">
						<option value="랩장" ${m.role == '랩장' ? 'selected' : ''}>랩장</option>
						<option value="부랩장" ${m.role == '부랩장' ? 'selected' : ''}>부랩장</option>
						<option value="랩원" ${m.role == '랩원' ? 'selected' : ''}>랩원</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<select name="status" class="form-control">
						<option value="재학" ${m.status == '재학' ? 'selected' : ''}>재학</option>
						<option value="휴학" ${m.status == '휴학' ? 'selected' : ''}>휴학</option>
						<option value="졸업" ${m.status == '졸업' ? 'selected' : ''}>졸업</option>
						<option value="수료" ${m.status == '수료' ? 'selected' : ''}>수료</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">현재 사진</label>
				<div class="col-sm-5">
					<img src="${m.profileImg}" style="width: 120px; height: 120px; object-fit: cover;">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">사진 변경</label>
				<div class="col-sm-5">
					<input type="file" name="file" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-5">
					<input type="email" name="email" class="form-control"
						value="${m.email}">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정 완료">
					<a href="${pageContext.request.contextPath}/labcontrol?action=memberList"
						class="btn btn-secondary">목록으로</a>
				</div>
			</div>

		</form>

		<hr>

	</div>

</body>
</html>