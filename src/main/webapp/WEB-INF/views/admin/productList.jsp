<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminPage.css">
</head>

<style>
.paging {
	margin: auto;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>
	<div class="container-fluid d-flex justify-content-center mt-5">
		<div class="overflow-hidden card table-nowrap shadow" style="width: 900px; min-width: 600px;">
			<div class="card-header bg-black text-white">Product List</div>
			<div class="table-responsive">
				<table class="table">
					<thead class="text-uppercase">
						<tr>
							<th class="col-1">상품코드</th>
							<th class="col-2">이미지</th>
							<th class="col-4">상품명</th>
							<th class="col-2">카테고리</th>
							<th class="col-2">가격</th>
							<th class="col-1">관리</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="product" items="${productList}">
							<tr class="align-middle">
								<td>${product.prId}</td>
								<td><img src="data:image/jpeg;base64,${product.prImageOut}" width="50px" alt="Product Image"></td>
								<td>${product.prName}</td>
								<td>${product.pcId}</td>
								<td>${product.prPrice}</td>
								<td><button class="btn btn-success btn-md rounded-pill border"
								onclick="location.href = 'productEdit?prId=${product.prId}'">Edit</button></td>
							</tr>
						</c:forEach>
						<tr class="align-middle">
							<td colspan="6" class="text-center">
								<div>
									<a class="btn btn-outline-primary btn-sm" href="productList?pageNo=1">처음</a>
									<c:if test="${pager.groupNo>1}">
										<a class="btn btn-outline-info btn-sm" href="productList?pageNo=${pager.startPageNo-1}">이전</a>
									</c:if>

									<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
										<c:if test="${pager.pageNo != i}">
											<a class="btn btn-outline-success btn-sm" href="productList?pageNo=${i}">${i}</a>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<a class="btn btn-danger btn-sm" href="productList?pageNo=${i}">${i}</a>
										</c:if>
									</c:forEach>

									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<a class="btn btn-outline-info btn-sm" href="productList?pageNo=${pager.endPageNo+1}">다음</a>
									</c:if>
									<a class="btn btn-outline-primary btn-sm" href="productList?pageNo=${pager.totalPageNo}">맨끝</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>