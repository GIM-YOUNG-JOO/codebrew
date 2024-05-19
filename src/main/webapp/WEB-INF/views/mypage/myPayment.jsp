<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.btn-outline-info {
    --bs-btn-color: #6c757d;
    --bs-btn-border-color: #6c757d;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #1f3933;
    --bs-btn-hover-border-color: #1f3933;
    --bs-btn-focus-shadow-rgb: 13, 202, 240;
    --bs-btn-active-color: #000;
    --bs-btn-active-bg: #1f3933;
    --bs-btn-active-border-color: #1f3933;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #0dcaf0;
    --bs-btn-disabled-bg: transparent;
    --bs-btn-disabled-border-color: #1f3933;
    --bs-gradient: none;
}
</style>
<body>
	
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
	
</body>
</html>