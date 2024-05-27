<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code Brew - Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/headerAndFooter.css">
</head>


<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="d-flex flex-column mt-5">
			<div class="row">
				<div class="col-lg-6 bg-info p-0">
					<img
						src="${pageContext.request.contextPath}/resources/image/main/appDay.jpg"
						class="w-100" id="imgBox">
				</div>
				<div
					class="col-lg-6 d-flex flex-column justify-content-center align-items-center p-5 overflow-hidden"
					id="main_box" style="background-color: #f7cdd0;">
					<h2>App 다운하면 음료 반값</h2>
					<br>
					<h5>5월까지 스타벅스 리워드에 가입하시면 음료 50% 할인을 받으실 수 있습니다. 앱을 다운받고 혜택을
						받으세요.</h5>
					<br>
					<button class="btn btn-outline-dark btn-md rounded-pill">회원가입</button>
				</div>
			</div>
		</div>
		<div class="d-flex flex-column mt-5">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center align-items-center p-5 overflow-hidden text-light"
					id="main_box" style="background-color: #1B3A34;">
					<h2>World Central Kitchen 후원</h2>
					<br>
					<h5>Odyssey Blend 판매 금액의 100%를 World Central Kitchen의 글로벌
						인도주의적 구호 활동을 위해 기부합니다.</h5>
					<br>
					<button class="btn btn-outline-light btn-md rounded-pill">주문하기</button>
				</div>
				<div class="col-lg-6 bg-info p-0">
					<img
						src="${pageContext.request.contextPath}/resources/image/main/donationBean.webp"
						class="w-100" id="imgBox">
				</div>
			</div>
		</div>
		<div class="d-flex flex-column mt-5">
			<div class="row">
				<div class="col-lg-6 bg-info p-0">
					<img
						src="${pageContext.request.contextPath}/resources/image/main/summerMenu.jpg"
						class="w-100" id="imgBox">
				</div>
				<div
					class="col-lg-6 d-flex flex-column justify-content-center align-items-center p-5 overflow-hidden text-light"
					id="main_box" style="background-color: #D52E97;">
					<h1>서머 시즌 삼형제</h1>
					<br>
					<h4>준비된 시원한 맛을 모두 즐겨보세요.</h4>
					<br>
					<button class="btn btn-outline-light btn-md rounded-pill">주문하기</button>
				</div>
			</div>
		</div>
		<div class="d-flex flex-column mt-5">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center align-items-center p-5 overflow-hidden"
					id="main_box" style="background-color: #C7E2F5;">
					<h2>App에서 최고의 거래를 만나보세요</h2>
					<br>
					<h5>여름 내내 새로운 혜택을 누려보세요. 매주 월요일 할인, 금요일 오후 12시부터 6시까지 음료 50%
						할인 등 다양한 혜택을 누리실 수 있습니다.</h5>
					<br>
					<button class="btn btn-outline-dark btn-md rounded-pill">회원가입</button>
				</div>
				<div class="col-lg-6 bg-info p-0">
					<img
						src="${pageContext.request.contextPath}/resources/image/main/appSky.jpg"
						class="w-100" id="imgBox">
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>