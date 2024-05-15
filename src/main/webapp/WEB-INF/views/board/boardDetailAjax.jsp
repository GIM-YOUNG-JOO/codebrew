<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="boardComment" items="${boardCommentList}">
<div class="card" style="width: 80%;">
	<div class="card-body">
		<h5 class="card-title">${boardComment.acId}</h5>
		<h6 class="card-subtitle mb-2 text-body-secondary">${boardComment.bocNewdate}</h6>
		<p class="card-text">
			${boardComment.bocContents}
		</p>
		<div class="card-link text-end">
			<i class="bi bi-hand-thumbs-up"></i> <span class="ms-2 me-2">${boardComment.bocLike}</span>
			<i class="bi bi-hand-thumbs-down"></i>
		</div>
	</div>
</div>
</c:forEach>