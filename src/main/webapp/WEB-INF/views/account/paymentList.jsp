<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">
</head>

<body>
	<%@ include file="/WEB-INF/views/common/myPageHeader.jsp"%>
	<div class="container-fluid d-flex justify-content-center mt-5">
		<div class="overflow-hidden card table-nowrap shadow" style="width: 900px; min-width: 600px;">
			<div class="card-header bg-black text-white">Product List</div>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="text-uppercase">
						<tr>
							<th>주문번호</th>
							<th>상품명</th>
							<th>개수</th>
							<th>주문자명</th>
							<th>전화번호</th>
							<th>주문일</th>
							<th>요청사항</th>
							<th>지점</th>
							<th>결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr class="align-middle">
							<td>1</td>
							<td>Americano</td>
							<td>1</td>
							<td>감자바</td>
							<td>010-1234-5678</td>
							<td>2024-04-29</td>
							<td>얼음 많이 넣어주세요</td>
							<td>가락시장점</td>
							<td>4000</td>
						</tr>
						<tr class="align-middle">
							<td>2</td>
							<td>Americano</td>
							<td>1</td>
							<td>감자바</td>
							<td>010-1234-5678</td>
							<td>2024-04-29</td>
							<td>얼음 많이 넣어주세요</td>
							<td>가락시장점</td>
							<td>4000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>