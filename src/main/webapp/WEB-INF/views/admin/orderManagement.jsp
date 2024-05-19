<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
#hovershadow {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

#hovershadow:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.pfont {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
	font-size: 2em;
}

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
			<div class="col p-4">
				<div class="d-flex">
					<div class="overflow-hidden card table-nowrap rounded-4 m-2" id="hovershadow">
						<div class="card-header bg-dark text-white">주문번호</div>
						<div class="card-body d-flex flex-column align-items-center">
							<h4>현재 상태</h4>
							<table class="table text-center table-bordered">
								<tbody>
									<tr>
										<td>상품명,<br> 블렌드,<br> 사이즈,<br> 샷,<br> 온도,<br> 수량</td>
										<td><strong>Americano</strong><br> Vanila<br> Grande<br> 3 shot<br> Hot<br> 2 cups</td>
									</tr>
								</tbody>
							</table>
							<div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">주문 접수</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">준비 중</a></li>
									<li><a class="dropdown-item" href="#">픽업 완료</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="overflow-hidden card table-nowrap rounded-4 m-2" id="hovershadow">
						<div class="card-header bg-dark text-white">주문번호</div>
						<div class="card-body d-flex flex-column align-items-center">
							<h4>주문 접수</h4>
							<table class="table text-center table-bordered">
								<tbody>
									<tr>
										<td>상품명,<br> 블렌드,<br> 사이즈,<br> 샷,<br> 온도,<br> 수량</td>
										<td><strong>Americano</strong><br> Vanila<br> Grande<br> 3 shot<br> Hot<br> 2 cups</td>
									</tr>
								</tbody>
							</table>
							<div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">상태 변경</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">준비 중</a></li>
									<li><a class="dropdown-item" href="#">픽업 완료</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>