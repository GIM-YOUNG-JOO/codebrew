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
<title>Admin - dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/slider.css" rel="stylesheet">
<style>
.pfont {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
	font-size: 2vmax;
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
			<%@ include file="/WEB-INF/views/admin/adminNavbar.jsp"%>
			<div class="col p-4 z-0">
				<div class="slider position-relative w-100 z-1 bg-dark rounded-4 overflow-hidden" style="height: 60%; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/coffee_man.jpg" class="card-img rounded-3" alt="...">
						<div class="card-body p-0">
							<p class="card-title pfont text-white">${dashboard.userCount}명</p>
							<p class="card-text pfont text-white">총 회원 수</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/coffee_money.jpg" class="card-img" alt="...">
						<div class="card-body p-0">
							<p class="card-title pfont text-white">${dashboard.totalSalesCount}잔</p>
							<p class="card-text pfont text-white">총 판매량</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/coffee_money.jpg" class="card-img" alt="...">
						<div class="card-body p-0">
							<p class="card-title pfont text-white">${dashboard.totalSalesRevenue}원</p>
							<p class="card-text pfont text-white">총 수익</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/cafeMenu.jpg" class="card-img" alt="...">
						<div class="card-body p-0">
							<p class="card-title pfont text-white">${dashboard.menuCount}개</p>
							<p class="card-text pfont text-white">메뉴 개수</p>
						</div>
					</div>
					<div class="card item">
						<img src="${pageContext.request.contextPath}/resources/image/codebrew.jpg" class="card-img" alt="...">
						<div class="card-body p-0">
							<p class="card-title pfont text-white">${dashboard.maker}명</p>
							<p class="card-text pfont text-white">제작 인원</p>
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