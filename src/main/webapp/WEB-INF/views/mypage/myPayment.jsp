<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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