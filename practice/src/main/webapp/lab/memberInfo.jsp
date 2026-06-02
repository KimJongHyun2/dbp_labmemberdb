<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<title>랩원 상세 정보</title>

<style>
	body {
		background-color: #f8f9fa;
	}

	.info-box {
		position: relative;
		background-color: white;
		padding: 30px;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0,0,0,0.08);
	}

	.member-menu {
		top: 20px;
		right: 20px;
	}

	.detail-menu-btn {
		width: 36px;
		height: 36px;
		border-radius: 50%;
		background-color: transparent !important;
		border: 0 !important;
		padding: 0;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		box-shadow: none !important;
	}

	.detail-menu-btn:hover {
		background-color: #f1f3f5 !important;
	}

	.detail-menu-btn:focus,
	.detail-menu-btn:active {
		background-color: transparent !important;
		box-shadow: none !important;
	}

	.detail-menu-btn.dropdown-toggle::after {
		display: none;
	}

	.detail-menu-dot {
		font-size: 26px;
		line-height: 1;
		color: #495057;
		font-weight: bold;
	}

	.profile-img {
		width: 100%;
		max-width: 350px;
		border-radius: 10px;
		border: 1px solid #ddd;
	}

	.info-title {
		font-size: 32px;
		font-weight: bold;
		margin-bottom: 25px;
	}

	.info-item {
		font-size: 20px;
		margin-bottom: 15px;
	}

	.status-badge {
		display: inline-block;
		padding: 8px 18px;
		background-color: #343a40;
		color: white;
		border-radius: 20px;
		font-size: 15px;
	}
</style>

</head>

<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">랩원 상세 정보</h1>
		</div>
	</div>

	<div class="container">

		<div class="info-box">

			<div class="dropdown position-absolute member-menu">
				<button class="btn detail-menu-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" aria-label="설정 메뉴">
					<span class="detail-menu-dot">⋮</span>
				</button>
				<ul class="dropdown-menu dropdown-menu-end">
					<li>
						<a class="dropdown-item text-danger"
							href="${pageContext.request.contextPath}/labcontrol?action=delete&id=${member.studentId}"
							onclick="return confirm('정말 삭제하시겠습니까?');">
							삭제하기
						</a>
					</li>
				</ul>
			</div>

			<div class="row">

				<div class="col-md-4 text-center">
					<img src="${m.profileImg}" class="profile-img">
				</div>

				<div class="col-md-8">

					<div class="info-title">${m.name}</div>

					<div class="info-item">
						<b>학번</b> : ${m.studentId}
					</div>

					<div class="info-item">
						<b>학년</b> : ${m.grade}학년
					</div>

					<div class="info-item">
						<b>전공</b> : ${m.major}
					</div>

					<div class="info-item">
						<b>역할</b> : ${m.role}
					</div>

					<div class="info-item">
						<b>상태</b> :
						<span class="status-badge">${m.status}</span>
					</div>

					<div class="info-item">
						<b>이메일</b> : ${m.email}
					</div>

					<br>

					<a href="${pageContext.request.contextPath}/labcontrol?action=editMember&id=${m.studentId}"
						class="btn btn-warning">
						정보 수정
					</a>

					<a href="${pageContext.request.contextPath}/labcontrol?action=memberList"
						class="btn btn-secondary">
						랩원 목록
					</a>

				</div>

			</div>

		</div>

		<hr>

	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>