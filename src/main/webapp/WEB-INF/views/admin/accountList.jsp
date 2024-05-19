<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>계정 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">
</head>

<style>
.paging {
	margin: auto;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>
	<div class="container-fluid d-flex justify-content-center mt-5">
		<div class="overflow-hidden card table-nowrap shadow" style="min-width: 600px;">
			<div class="card-header bg-black text-white">Account List</div>
			<div class="table-responsive">
				<table class="table">
					<thead class="text-uppercase">
						<tr>
							<th class="col-1">ID</th>
							<th class="col-2">Name</th>
							<th class="col-1">Password</th>
							<th class="col-2">Tel</th>
							<th class="col-3">E-Mail</th>
							<th class="col-1">ROLE</th>
							<th class="col-1">Edit</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="account" items="${accountList}">
							<tr class="align-middle">
								<td>${account.acId}</td>
								<td>${account.acName}</td>
								<td>Hidden</td>
								<td>${account.acTel}</td>
								<td>${account.acEmail}</td>
								<td>${account.acRole}</td>
								<td>
									<button class="btn btn-success btn-md rounded-pill border" data-bs-toggle="modal" data-bs-target="#accountModal${account.acId}">Edit</button>
								</td>
							</tr>

							<div class="modal fade" id="accountModal${account.acId}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">계정 정보 수정</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form id="accountEdit" method="post" action="accountUpdate">
											<input type="hidden" class="form-control" id="acId" name="acId" value="${account.acId}">
											<div class="modal-body">
												<div class="input-group flex-grow-1 p-2">
													<span class="input-group-text">이름</span> <input type="text" class="form-control" id="acName" name="acName" placeholder="Product No"
														aria-label="Username" aria-describedby="basic-addon1" value="${account.acName}">
												</div>
												<div class="input-group flex-grow-1 p-2">
													<span class="input-group-text text-center">비밀번호</span> <input type="text" class="form-control" id="acPassword" name="acPassword"
														placeholder="Menu Name" aria-label="Username" aria-describedby="basic-addon1" value="${account.acPassword}">
												</div>
												<div class="input-group flex-grow-1 p-2">
													<span class="input-group-text text-center">전화번호</span> <input type="text" class="form-control" id="acTel" name="acTel"
														placeholder="Menu Name" aria-label="Username" aria-describedby="basic-addon1" value="${account.acTel}">
												</div>
												<div class="input-group flex-grow-1 p-2">
													<span class="input-group-text text-center">이메일</span> <input type="text" class="form-control" id="acEmail" name="acEmail"
														placeholder="Menu Name" aria-label="Username" aria-describedby="basic-addon1" value="${account.acEmail}">
												</div>
												<div class="input-group flex-grow-1 p-2">
													<label class="input-group-text" for="pcid">권한</label> <select class="form-select" id="acRole" name="acRole">
														<option value="ROLE_USER" ${account.acRole.equals("ROLE_USER") ? 'selected' : ''}>사용자</option>
														<option value="ROLE_ADMIN" ${account.acRole.equals("ROLE_ADMIN") ? 'selected' : ''}>관리자</option>
													</select>
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-light btn-md rounded-pill border" formtarget="accountEdit">Save</button>
												<button type="button" class="btn btn-dark btn-md rounded-pill border" data-bs-dismiss="modal">Cancel</button>
												<a href="accountDelete?acId=${account.acId}" class="btn btn-danger btn-md rounded-pill border">Delete</a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
						<tr class="align-middle">
							<td colspan="7" class="text-center">
								<div>
									<a class="btn btn-outline-primary btn-sm" href="accountList?pageNo=1">처음</a>
									<c:if test="${pager.groupNo>1}">
										<a class="btn btn-outline-info btn-sm" href="accountList?pageNo=${pager.startPageNo-1}">이전</a>
									</c:if>

									<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
										<c:if test="${pager.pageNo != i}">
											<a class="btn btn-outline-success btn-sm" href="accountList?pageNo=${i}">${i}</a>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<a class="btn btn-danger btn-sm" href="accountList?pageNo=${i}">${i}</a>
										</c:if>
									</c:forEach>

									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<a class="btn btn-outline-info btn-sm" href="accountList?pageNo=${pager.endPageNo+1}">다음</a>
									</c:if>
									<a class="btn btn-outline-primary btn-sm" href="accountList?pageNo=${pager.totalPageNo}">맨끝</a>
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