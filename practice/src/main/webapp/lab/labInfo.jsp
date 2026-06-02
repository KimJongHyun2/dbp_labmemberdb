<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>연구실 소개</title>
    <style>
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/img/lab_main.jpg') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        .section-title {
            margin-top: 50px;
            margin-bottom: 30px;
            font-weight: bold;
            border-left: 5px solid #007bff;
            padding-left: 15px;
        }
        .badge-tag { margin-right: 5px; font-size: 14px; }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 font-weight-bold">Awesome Lab</h1>
            <p class="lead">"미래를 혁신하는 인공지능과 소프트웨어 기술의 중심"</p>
        </div>
    </div> 

    <div class="container">
        <h3 class="section-title">연구 분야 (Research Areas)</h3>
        <div class="card bg-light mb-4">
            <div class="card-body">
                <p class="card-text" style="line-height: 1.8;">
                    우리 연구실은 최신 딥러닝 기반 알고리즘 설계 및 대규모 데이터 분산 처리 소프트웨어를 깊이 있게 연구합니다. 
                    핵심 인프라 기술부터 실생활에 적용 가능한 응용 애플리케이션까지 풀스택 연구 스펙트럼을 지향하고 있으며, 
                    국내외 유수 기관 및 기업들과 다양한 산학 협력 프로젝트를 활발히 수행 중입니다.
                </p>
                <div>
                    <span class="badge badge-primary badge-tag">#Artificial_Intelligence</span>
                    <span class="badge badge-success badge-tag">#Web_Development</span>
                    <span class="badge badge-info badge-tag">#Big_Data</span>
                    <span class="badge badge-warning badge-tag">#Cloud_Computing</span>
                </div>
            </div>
        </div>

        <h3 class="section-title">지도 교수 (Advisor)</h3>
        <div class="row mb-4 align-items-center"> <!-- align-items-center 추가로 텍스트와 높이 맞춤 -->
            <div class="col-md-3 text-center">
                <!-- 사진 대신 이모티콘을 넣고 크기와 원형 배경을 지정 -->
                <div class="img-thumbnail rounded-circle bg-light d-flex align-items-center justify-content-center" style="width:150px; height:150px; font-size: 80px; margin: 0 auto;">
                    👨‍🏫
                </div>
            </div>
            <div class="col-md-9" style="font-size: 17px; line-height: 2;">
                <strong>박성진 교수 (Sungjin Park, Ph.D.)</strong><br>
                <ul>
                    <li><strong>직위 :</strong> 교수</li>
                    <li><strong>전공 :</strong> 컴퓨터응용(데이터베이스)</li>
                    <li><strong>연락처 :</strong> 031-379-0641</li>
                    <li><strong>이메일 :</strong> sjpark@hs.ac.kr</li>
                    <li><strong>연구실 위치 :</strong> (18413) 장준하통일관</li>
                </ul>
            </div>
        </div>

        <h3 class="section-title">연구실 위치 (Lab Location)</h3>
        <p style="font-size: 16px;">📍 <strong>대한민국 경기도 오산시 양산동 400번지 장준하통일관</strong></p>
      <div class="embed-responsive embed-responsive-16by9 mb-4" style="max-height: 300px;">
    <iframe class="embed-responsive-item" src="https://maps.google.com/maps?q=%ED%95%9C%EC%8B%A0%EB%8C%80%ED%95%99%EA%B5%90%20%EC%1E%A5%EC%A4%80%ED%95%98%ED%86%B5%EC%9D%BC%EA%B4%80&t=&z=15&ie=UTF8&iwloc=&output=embed" allowfullscreen></iframe>
            </div>
        <h3 class="section-title">랩원 구성원 (Members)</h3>
        <div class="row text-center mb-4">
            <div class="col-md-4">
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title text-primary">재학생</h5>
                        <p class="card-text display-4">${countActive != null ? countActive : 0}명</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title text-success">휴학생</h5>
                        <p class="card-text display-4">${countLeave != null ? countLeave : 0}명</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-secondary mb-3">
                    <div class="card-body">
                        <h5 class="card-title text-secondary">졸업생</h5>
                        <p class="card-text display-4">${countGrad != null ? countGrad : 0}명</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mb-4">
            <a href="${pageContext.request.contextPath}/labcontrol?action=memberList" class="btn btn-outline-primary btn-lg">➡️ 랩원 상세 목록 보러가기</a>
        </div>

        <h3 class="section-title">주요 성과 (Key Achievements)</h3>
        <ul class="list-group list-group-flush mb-4" style="font-size: 16px; line-height: 1.8;">
            <li class="list-group-item">🏆 2025년도 SW종합학술대회 우수 논문상 수상 (한국컴퓨터학회)</li>
            <li class="list-group-item">📄 "XML 문서 변경 탐지 기능을 갖는 통합 리포지토리 시스템" - 한국산학기술학회논문지 게재 완료</li>
            <li class="list-group-item">🚀 2026년도 정부 주관 인공지능 기초연구실(BRL) 국책 사업 선정</li>
        </ul>

        <h3 class="section-title">연락 및 지원 (Contact & Join Us)</h3>
        <div class="jumbotron p-4 bg-dark text-white">
            <p class="lead">우리 연구실은 학부 인턴 및 석/박사 통합과정 신입생을 모집하고 있습니다.</p>
            <hr class="my-4 bg-light">
            <ul>
                <li>📧 <strong>지원 문의 이메일 :</strong> sjpark@hs.ac.kr</li>
                <li>🌐 <strong>학과 홈페이지 :</strong> <a href="https://www.hs.ac.kr/sce/index.do" target="_blank" class="text-info">한신대학교 컴퓨터공학부 바로가기</a></li>
            </ul>
        </div>
    </div>  

    <jsp:include page="footer.jsp" />
</body>
</html>