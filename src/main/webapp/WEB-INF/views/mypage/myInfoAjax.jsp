<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!-- AJAX로 변경하는 시작점 -->
<div id="innerContainer"
	class="p-5 d-flex flex-grow-1 align-items-center">
	<div class="p-5 d-flex align-items-center">
		<div id="hovershadow"
			class="p-5 rounded-4 d-flex flex-column align-items-center"
			style="background-color: #F0F0F0;">
			<img
				src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
				width="200px" class="rounded-4 mt-5 ms-5 me-5" />
			<div class="row h5 text-secondary mb-5 pfont">${accountChanged.acRole}</div>
			<div class="row h1 text-dark pfont">${accountChanged.acName}</div>
			<div class="row h5 text-info mb-5 pfont">${accountChanged.acEmail}</div>
			<div class="row h3 text-dark pfont">${accountChanged.acTel}</div>
		</div>
	</div>

<%-- 	<form id="changeMyInfoForm" name="changeMyInfoForm" method="post"
		action="myInfoChange">
		<div class="p-5 flex-grow-1 d-flex align-items-center">
			<div id="hovershadow"
				class="d-grid gap-4 p-5 bg-dark rounded-4 w-100">
				<div class="row text-center">
					<h1 class="text-light pfont">개인정보 수정</h1>
				</div>
				<div class="row">
					<div class="col-4">
						<img
							src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
							width="100%">
						<div class="input-group">
							<input type="file" class="form-control btn btn-outline-secondary"
								id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"
								aria-label="Upload">
						</div>
					</div>
					<div class="col-8 flex-column d-grid gap-4 ps-5 pe-4">
						<div class="row">
							<label class="form-label h4 text-light pfont align-text-bottom">Name</label>
							<input class="form-control" list="datalistOptions" id="acName"
								value="${accountChanged.acName}">
						</div>
						<div class="row">
							<label class="form-label h4 text-light pfont">E-Mail</label> <input
								class="form-control" id="acEmail" value="${accountChanged.acEmail}">
						</div>
						<div class="row">
							<label class="form-label h4 text-light pfont">Tel</label> <input
								class="form-control" id="acTel" value="${accountChanged.acTel}">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label class="form-label h4 text-light pfont">PW</label> <input
							class="form-control" list="datalistOptions" type="password"
							id="acPassword" value="">
					</div>
					<div class="col">
						<label class="form-label h4 text-light pfont">Confirm PW</label> <input
							class="form-control" list="datalistOptions" type="password"
							id="acPasswordCheck" value="">
					</div>
				</div>
				<div class="d-flex justify-content-around">
					<div class="d-flex justify-content-around">
						<button type="button" onclick="changeMyInfo()" class="btn btn-outline-info btn-lg">저장</button>
						<button class="btn btn-outline-secondary btn-lg" onclick="">비우기</button>
					</div>
				</div>
			</div>
		</div>
	</form> --%>
</div>

