<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>랩원 목록</title>

<style>
	body {
		background-color: #f8f9fa;
	}

	.jumbotron {
		background-color: #e9ecef;
		margin-bottom: 40px;
	}

	.table-box {
		background-color: white;
		padding: 25px;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	}

	.member-img {
		width: 70px;
		height: 70px;
		object-fit: cover;
		border-radius: 8px;
		border: 1px solid #dee2e6;
	}

	th {
		text-align: center;
		background-color: #343a40;
		color: white;
	}

	td {
		text-align: center;
		vertical-align: middle !important;
	}

	.status-badge {
		padding: 6px 14px;
		border-radius: 20px;
		background-color: #343a40;
		color: white;
		font-size: 14px;
	}

	.btn-detail {
		border-radius: 20px;
		padding: 6px 18px;
	}
</style>

</head>

<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">랩원 목록</h1>
			<p class="lead">연구실 구성원 정보를 출석부 형태로 확인할 수 있습니다.</p>
		</div>
	</div>

	<div class="container">

		<div class="table-box">

			<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>사진</th>
			<th>이름</th>
			<th>학번</th>
			<th>학년</th>
			<th>전공</th>
			<th>이메일</th>
			<th>상태</th>
			<th>관리</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="m" items="${members}" varStatus="status">
			<tr>
				<td>${status.count}</td>

				<td>
					<img src="${m.profileImg}" class="member-img">
				</td>

				<td><strong>${m.name}</strong></td>

				<td>${m.studentId}</td>

				<td>${m.grade}학년</td>

				<td>${m.major}</td>

				<td>${m.email}</td>

				<td>
					<span class="status-badge">${m.status}</span>
				</td>

				<td>
					<a href="${pageContext.request.contextPath}/labcontrol?action=memberInfo&id=${m.studentId}"
						class="btn btn-secondary btn-sm btn-detail">
						상세 정보
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

		</div>

		<hr>

	</div>

</body>
</html>d