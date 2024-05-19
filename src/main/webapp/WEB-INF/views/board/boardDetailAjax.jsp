<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- jquery 외부 라이브러리 사용 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardDetail.css">
<style>


</style>

<div class="d-flex align-items-center flex-column" id="boardCommentContainer" style="width:100%">
	<div class="h1 flex-grow-1">Comment</div>
	<c:forEach var="boardComment" items="${boardCommentList}">
		<div class="card" style="width: 80%;">
			<div class="card-body">
				<h5 class="card-title">${boardComment.acId}</h5>
				<h6 class="card-subtitle mb-2 text-body-secondary">${boardComment.bocNewdate}</h6>
				<p class="card-text">${boardComment.bocContents}</p>
				<div class="card-link text-end">
					<i class="bi bi-hand-thumbs-up like_button" onclick="boardCommentLike('${boardComment.bocId}',1)"></i> <span class="ms-2 me-2" id="board_like_account${boardComment.bocId}">${boardComment.bocLike}</span>
					<i class="bi bi-hand-thumbs-down like_button" onclick="boardCommentLike('${boardComment.bocId}',-1)"></i>
					<input type="hidden" id="container${boardComment.bocId}" value="${boardComment.bocLike}">
				</div>
				<c:if test="${boardComment.acId eq user}">
				<div style="width: 100%; height: 30px;"></div>
				<button type="button" class="btn btn-success" style="float:right;" onclick="boardCommentDelete('${boardComment.bocId}','${boardComment.boId}',this)">삭제</button>
				</c:if>
			</div>
		</div>
	</c:forEach>
</div>