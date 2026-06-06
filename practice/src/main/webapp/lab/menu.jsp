<%@ page contentType="text/html; charset=utf-8"%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">

		<div class="navbar-header">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/labcontrol?action=welcome">
				Home
			</a>
		</div>

		<div>
			<ul class="navbar-nav mr-auto">

				<%
					String adminId = (String) session.getAttribute("adminId");
					if (adminId == null) {
				%>

				<li class="nav-item">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/labcontrol?action=login">
						로그인
					</a>
				</li>

				<%
					} else {
				%>

				<li class="nav-item">
					<span class="navbar-text text-white">
						[<%=adminId%>님]
					</span>
				</li>

				<li class="nav-item">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/labcontrol?action=processLogout">
						로그아웃
					</a>
				</li>

				<%
					}
				%>

				<li class="nav-item">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/labcontrol?action=labInfo">
						랩실소개
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/labcontrol?action=memberList">
						랩원목록
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/labcontrol?action=addMember">
						랩원등록
					</a>
				</li>

			</ul>
		</div>

	</div>
</nav>
