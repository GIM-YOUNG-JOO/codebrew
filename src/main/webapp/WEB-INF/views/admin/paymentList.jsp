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
<title>결제 내역</title>
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

/* ::-webkit-scrollbar {
	display: none;
} */
</style>
</head>

<body class="p-5 h-100">
	<div class="container-fluid bg-white rounded-4"
		style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
		<div class="row">
			<%@ include file="/WEB-INF/views/admin/adminNavbar.jsp"%>
			<div class="col p-4">
				<table class="table table-bordered border-light table-dark table-striped align-middle">
					<thead>
						<tr>
							<th>주문정보</th>
							<th>주문자</th>
							<th>요청사항</th>
							<th>총액</th>
							<th>상품</th>
							<th>수량</th>
							<th>상품가</th>
						</tr>
					</thead>
					<c:forEach var="payment" items="${paymentList}">
						<tbody>
							<tr>
								<td rowspan="${payment.detailCount}">${payment.paId}<br>${payment.paDate}<br>${payment.brName}</td>
								<td rowspan="${payment.detailCount}">${payment.paName}<br>${payment.paTel}</td>
								<td rowspan="${payment.detailCount}">${payment.paRequest}</td>
								<td rowspan="${payment.detailCount}">${payment.paPay}</td>
							</tr>
							<c:forEach var="pd" items="${payment.paymentDetail}">
								<tr>
									<td>${pd.prName}<br>${pd.sopName} / ${pd.bopName} / ${pd.topName} / ${pd.pdShotCount}shots
									</td>
									<td>${pd.pdCount}</td>
									<td>${pd.prPrice}</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>