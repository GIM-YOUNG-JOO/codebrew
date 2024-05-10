<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Offcanvas Example</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
.item {
	position: absolute;
	width: 20%;
	height: 90%;
	text-align: center;
	margin-top: 20px;
	padding: 20px;
	transition: 0.5s;
	left: calc(50% - 150px);
	top: 0;
	z-index: 100;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

#next {
	position: absolute;
	right: 7%;
	top: 50%;
}

#prev {
	position: absolute;
	left: 7%;
	top: 50%;
}

/* #prev,
        #next {
            color: #fff;
            background: none;
            border: none;
            font-size: xxx-large;
            font-family: monospace;
            font-weight: bold;
            opacity: 0.5;
            transition: opacity 0.5s;
        }

        #prev:hover,
        #next:hover {
            opacity: 1;
        } */
::-webkit-scrollbar {
	display: none;
}
</style>
</head>

<body class="vh-100 p-5">
	<div class="container-fluid h-100 bg-white rounded-4"
		style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
		<div class="row h-100">
			<div class="d-flex col flex-column flex-shrink-0 p-3 text-white bg-dark h-100 rounded-start-4"
				style="max-width: 280px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
				<a href="/" class="d-flex justify-content-center align-items-center text-white text-decoration-none"> <span class="fs-4">Code Brew</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li><a href="#" class="nav-link text-white"> <i class="bi bi-speedometer me-2"></i> Dashboard
					</a></li>
					<li><a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false"> <i
							class="bi bi-box me-2"></i> Product
					</a>
						<div class="collapse" id="dashboard-collapse">
							<ul class="ms-2">
								<li><a href="#" class="text-white text-decoration-none">상품 목록</a></li>
								<li><a href="#" class="text-white text-decoration-none">상품 등록</a></li>
								<li><a href="#" class="text-white text-decoration-none">상품 관리</a></li>
								<li><a href="#" class="text-white text-decoration-none">상품 삭제</a></li>
							</ul>
						</div></li>
					<li><a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false"> <i
							class="bi bi-person-video2 me-2"></i> Account
					</a>
						<div class="collapse" id="account-collapse">
							<ul class="ms-2">
								<li><a href="#" class="text-white text-decoration-none">계정 목록</a></li>
								<li><a href="#" class="text-white text-decoration-none">계정 등록</a></li>
								<li><a href="#" class="text-white text-decoration-none">계정 관리</a></li>
								<li><a href="#" class="text-white text-decoration-none">계정 삭제</a></li>
							</ul>
						</div></li>
					<li><a href="#" class="nav-link text-white"> <i class="bi bi-cpu me-2"></i> Guitar
					</a></li>
				</ul>
				<hr>
				<div class="dropdown">
					<a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown"
						aria-expanded="false"> <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2"> <strong><sec:authentication property="principal.username"/></strong>
					</a>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">Sign out</a></li>
					</ul>
				</div>
			</div>
			<div class="col p-4 z-0">
				<div class="slider position-relative w-100 z-1 bg-dark rounded-4 overflow-hidden" style="height: 60%; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/cut/Americano.jpg" class="card-img-top rounded-3" alt="...">
						<div class="card-body">
							<h5 class="card-title h1">500 명</h5>
							<p class="card-text h3">총 회원 수</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/cut/Americano.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title h1">4082108 잔</h5>
							<p class="card-text h3">총 판매량</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/cut/Americano.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title h2">15,000,000 원</h5>
							<p class="card-text h3">총 수익</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/cut/Americano.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title h1">200 개</h5>
							<p class="card-text h3">메뉴 개수</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/cut/Americano.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title h1">4 명</h5>
							<p class="card-text h4">프로젝트 제작 인원</p>
						</div>
					</div>
					<button class="btn btn-dark" id="next" style="font-size: xx-large;">>></button>
					<button class="btn btn-dark" id="prev" style="font-size: xx-large;"><<</button>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
	<script>
		window.addEventListener('resize', adjustLeftPosition);
		window.addEventListener('DOMContentLoaded', adjustLeftPosition);
	</script>
</body>

</html>