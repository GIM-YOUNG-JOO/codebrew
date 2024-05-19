<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!-- AJAX로 변경하는 시작점 -->

<div id="hovershadow"
	class="p-5 rounded-4 d-flex flex-column align-items-center"
	style="background-color: #1f3933;">
	<img
		src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
		width="200px" class="rounded-4 mt-5 ms-5 me-5" />
	<div class="row h5 text-secondary mb-5 pfont">${accountChanged.acRole}</div>
	<div class="row h1 text-dark pfont">${accountChanged.acName}</div>
	<div class="row h5 text-info mb-5 pfont">${accountChanged.acEmail}</div>
	<div class="row h3 text-dark pfont">${accountChanged.acTel}</div>
</div>

