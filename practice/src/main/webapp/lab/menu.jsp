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
					String sessionId = (String) session.getAttribute("sessionId");

					if (sessionId == null) {
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

				<li style="padding-top: 7px; color: white">
					[<%=sessionId%>님]
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