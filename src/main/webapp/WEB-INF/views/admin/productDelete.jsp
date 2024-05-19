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
<title>상품 삭제</title>
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
				<div class="overflow-hidden card table-nowrap rounded-4" id="hovershadow">
					<div class="card-header bg-dark text-white">Product List</div>
					<div class="card-body d-flex flex-column align-items-center p-0">
						<table class="table text-center">
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
										<td>${product.pcName}</td>
										<td>${product.prPrice}</td>
										<td>
											<form method="post" action="productDeleteComplete">
												<input type="hidden" name="prId" value="${product.prId}">
												<button class="btn btn-danger btn-md rounded-pill border" type="submit">Delete</button>
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="mb-3">
							<a class="btn btn-outline-primary btn-sm" href="productDelete?pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="productDelete?pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>

							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="productDelete?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="productDelete?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>

							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="productDelete?pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-primary btn-sm" href="productDelete?pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>