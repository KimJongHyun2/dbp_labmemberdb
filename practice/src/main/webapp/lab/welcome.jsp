<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Awesome Lab - 메인</title>
<style>
	.welcome-heading {
		font-weight: bold;
		color: #343a40;
	}
	.counter-box {
		background-color: #f8f9fa;
		padding: 20px;
		border-radius: 10px;
		display: inline-block;
		box-shadow: 0 4px 6px rgba(0,0,0,0.05);
	}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron bg-light text-center py-5">
		<div class="container">
			<h1 class="display-4 welcome-heading mb-3">연구실 관리 시스템</h1>
			<p class="lead text-muted">Awesome Lab의 구성원 및 연구 현황을 관리하는 공간입니다.</p>
		</div>
	</div>	
	
	<div class="container my-5">
		<div class="text-center">
			<h3 class="mb-4">Welcome to Awesome Lab Portal!</h3>
			
			<%!
				int pageCount = 0;
				void addCount() {
					pageCount++;
				}
			%>
			<% 	addCount();  %>
			
			<div class="counter-box">
				<p class="mb-0" style="font-size: 18px;">
					📢 본 시스템의 <span style="color:#007bff; font-weight:bold;"><%=pageCount%></span>번째 방문자이십니다.
				</p>
			</div>
			
			<div class="mt-5">
				<a href="${pageContext.request.contextPath}/labcontrol?action=labInfo" class="btn btn-primary btn-lg mr-2">🔬 랩실 소개 보기</a>
				<a href="${pageContext.request.contextPath}/labcontrol?action=memberList" class="btn btn-outline-secondary btn-lg">👥 랩원 목록 조회</a>
			</div>
		</div>
		<hr class="my-5">
	</div>	
	
	<jsp:include page="footer.jsp" />
</body>
</html>