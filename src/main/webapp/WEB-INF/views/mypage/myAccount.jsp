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
	<div id="innerContainer"
		class="px-5 d-flex flex-grow-1 align-items-center">
		<div id="myInfoDetailBox" class="p-5 d-flex align-items-center">
			<div id="hovershadow"
				class="p-5 rounded-4 d-flex flex-column align-items-center"
				style="background-color: #F0F0F0;">
				<img
					src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
					width="200px" class="rounded-4 mt-5 ms-5 me-5" />
				<div class="row h5 text-secondary mb-5 pfont">${account.acRole}</div>
				<div class="row h2 text-dark pfont">${account.acName}</div>
				<div class="row h5 text-info mb-5 pfont">${account.acEmail}</div>
				<div class="row h3 text-dark pfont">${account.acTel}</div>
			</div>
		</div>

		<form id="changeMyInfoForm" name="changeMyInfoForm" method="post"
			action="myInfoChange" onsubmit="changeMyInfo()" novalidate>
			<div class="p-5 flex-grow-1 d-flex align-items-center">
				<div id="hovershadow" class="d-grid gap-4 p-5 rounded-4 w-100"
					style="background: rgba(var(--bs-dark-rgb), var(--bs-bg-opacity)) !important;">
					<div class="row text-center">
						<h2 class="text-light pfont">개인정보 수정</h2>
					</div>
					<div class="row">
						<div class="col-4">
							<img
								src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
								width="100%">
							<div class="input-group">
								<input type="file"
									class="form-control btn btn-outline-secondary"
									id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"
									aria-label="Upload">
							</div>
						</div>
						<div class="col-8 flex-column d-grid gap-2 ps-5 pe-4">
							<div class="row">
								<label class="form-label h4 text-light pfont align-text-bottom">Name</label>
								<input class="form-control" list="datalistOptions" id="acName"
									name="acName" value="${account.acName}">
								<h6 id="acNameAlarm" class="form-text p-1 text-light">한글 이름
									2~5자</h6>
								<%--<form:errors path="acName" class="text-light"/>--%>
							</div>
							<div class="row">
								<label class="form-label h4 text-light pfont">E-Mail</label> <input
									class="form-control" id="acEmail" name="acEmail"
									value="${account.acEmail}">
								<h6 id="acEmailAlarm" class="form-text p-1 text-light">'@'를
									넣어서 작성해주세요</h6>
								<%-- <form:errors path="acEmail" class="text-light"/> --%>
							</div>
							<div class="row">
								<label class="form-label h4 text-light pfont">Tel</label> <input
									class="form-control" id="acTel" name="acTel"
									value="${account.acTel}">
								<h6 id="acTelAlarm" class="form-text p-1 text-light">'-'를
									넣어서 작성해주세요</h6>
								<%-- <form:errors path="acTel" class="text-light"/> --%>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<label class="form-label h4 text-light pfont">PW</label> <input
								class="form-control" list="datalistOptions" type="password"
								id="acPassword" name="acPassword" value="">
							<h6 id="acPasswordAlarm" class="form-text p-1 text-light">알파벳
								대소문자와 숫자를 혼용해서 8~15자</h6>
							<%-- <form:errors path="acPassword" class="text-light"/>--%>
						</div>
						<div class="col">
							<label class="form-label h4 text-light pfont">ConfirmPW</label> <input
								class="form-control" list="datalistOptions" type="password"
								id="acPasswordCheck" name="acPasswordCheck" value="">
							<h6 id="acPasswordCheckAlarm" class="form-text p-1 text-light">비밀번호를
								한 번 더 입력해주세요</h6>
						</div>
						<div class="row">
							<h6 id="changeMyInfoAlarm" class="text-light m-3">※ 개인 정보
								수정은 비밀번호를 반드시 입력해야합니다.</h6>
						</div>
					</div>
					<div class="d-flex justify-content-around">
						<button id="emptyMyInfoFormBtn"
							class="btn btn-outline-secondary btn-lg" type="button"
							onclick="emptyMyInfoForm()">비우기</button>
						<button id="bringMyInfoFormBtn"
							class="btn btn-outline-secondary btn-lg" type="button"
							onclick="bringMyInfoForm()">내정보 가져오기</button>
						<button id="changeMyInfoBtn" class="btn btn-outline-info btn-lg">저장</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>