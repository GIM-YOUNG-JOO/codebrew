<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Offcanvas Example</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<style>
#hovershadow {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

#hovershadow:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

* {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
}

body {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
}
.btn-outline-info{
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
div.row.h5.text-info.mb-5.pfont{
	color: green !important;
}
</style>
</head>



<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="p-5">
		<div class="container-fluid bg-white rounded-4 p-0 shadow-lg"
			style="height: 80%">
			<div class="d-flex flex-row">
				<div
					class="d-flex col flex-column flex-shrink-0 p-3 text-white bg-dark rounded-start-4"
					style="max-width: 280px; min-width: 280px;">
					<a href="${pageContext.request.contextPath}"
						class="d-flex justify-content-center align-items-center text-white text-decoration-none">
						<span class="fs-4 pfont">마이 페이지</span>
					</a>
					<hr>
					<ul class="nav nav-pills flex-column mb-auto">
						<li><a href="#" class="nav-link text-white fs-3 pfont"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false" onclick="myPaymentHistory()"> <i class="bi bi-box me-2"></i> 주문 기록
						</a>
						</li>
						<li><a href="#" class="nav-link text-white fs-3 pfont"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false" onclick="myAccount()"> <i class="bi bi-person-video2 me-2"></i>
								개인정보
						</a>
							</li>
						<li><a href="#" class="nav-link text-white fs-3 pfont"
							data-bs-toggle="collapse" data-bs-target="#board-collapse"
							aria-expanded="false"> <i class="bi bi-chat-left-text me-2"></i>
								활동 내역
						</a>
							<div class="collapse" id="board-collapse">
								<ul class="ms-2">
									<li><a href="#" class="text-white text-decoration-none"
										onclick="myWriteBoardHistory()">작성한 글</a></li>
									<li><a href="#" class="text-white text-decoration-none"
										onclick="myWriteBoardCommentHistory()">작성한 댓글</a></li>
								</ul>
							</div></li>
					</ul>
					<hr>
					<div class="dropdown">
						
						<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
							aria-labelledby="dropdownUser1">
<!-- 							<li><a class="dropdown-item" href="#">New project...</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="#">Profile</a></li>
							<li>
								<hr class="dropdown-divider">
							</li> -->
							<li><a class="dropdown-item" href="#">Sign out</a></li>
						</ul>
					</div>
				</div>

				<!-- AJAX로 변경하는 시작점 -->
				<div id="innerContainer"
					class="px-5 d-flex flex-grow-1 align-items-center">
					<div id="myInfoDetailBox" class="p-5 d-flex align-items-center">
						<div id="hovershadow"
							class="p-5 rounded-4 d-flex flex-column align-items-center"
							style="background-color: #F0F0F0;">
							<img
								src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
								width="200px" class="rounded-4 mt-5 ms-5 me-5" />
							<div class="row h2 text-dark pfont">${account.acName}</div>
							<div class="row h5 text-info mb-5 pfont">${account.acEmail}</div>
							<div class="row h3 text-dark pfont">${account.acTel}</div>
						</div>
					</div>

					<form 
						id="changeMyInfoForm" 
						name="changeMyInfoForm" 
						method="post"
						action="myInfoChange"
						onsubmit="changeMyInfo()"
						novalidate>
						<div class="p-5 flex-grow-1 d-flex align-items-center">
							<div id="hovershadow"
								class="d-grid gap-4 p-5 rounded-4 w-100" style="background: rgba(var(--bs-dark-rgb), var(--bs-bg-opacity)) !important;">
								<div class="row text-center">
									<h2 class="text-light pfont">개인정보 수정</h2>
								</div>
								<div class="row">
									<div class="col-4">
										<img
											src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png"
											width="100%">
										<div class="input-group">
											<input type="file" class="form-control btn btn-outline-secondary" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
										</div>
									</div>
									<div class="col-8 flex-column d-grid gap-2 ps-5 pe-4">
										<div class="row">
											<label class="form-label h4 text-light pfont align-text-bottom">Name</label>
											<input class="form-control" list="datalistOptions" id="acName" name="acName" value="${account.acName}">
											<h6 id="acNameAlarm" class="form-text p-1 text-light">한글 이름 2~5자</h6>
											<%--<form:errors path="acName" class="text-light"/>--%>
										</div>
										<div class="row">
											<label class="form-label h4 text-light pfont">E-Mail</label>
											<input class="form-control" id="acEmail" name="acEmail" value="${account.acEmail}">
											<h6 id="acEmailAlarm" class="form-text p-1 text-light">'@'를 넣어서 작성해주세요</h6>
											<%-- <form:errors path="acEmail" class="text-light"/> --%>
										</div>
										<div class="row">
											<label class="form-label h4 text-light pfont">Tel</label> 
											<input class="form-control" id="acTel" name="acTel" value="${account.acTel}">
											<h6 id="acTelAlarm" class="form-text p-1 text-light">'-'를 넣어서 작성해주세요</h6>
											<%-- <form:errors path="acTel" class="text-light"/> --%>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col">
										<label class="form-label h4 text-light pfont">PW</label> 
										<input class="form-control" list="datalistOptions" type="password" id="acPassword" name="acPassword" value="">										
										<h6 id="acPasswordAlarm" class="form-text p-1 text-light">알파벳 대소문자와 숫자를 혼용해서 8~15자</h6>
										<%-- <form:errors path="acPassword" class="text-light"/>--%>
									</div>
									<div class="col">
										<label class="form-label h4 text-light pfont">ConfirmPW</label> 
										<input class="form-control" list="datalistOptions" type="password" id="acPasswordCheck" name="acPasswordCheck" value="">
										<h6 id="acPasswordCheckAlarm" class="form-text p-1 text-light">비밀번호를 한 번 더 입력해주세요</h6>
									</div>
									<div class="row">
										<h6 id="changeMyInfoAlarm" class="text-light m-3">※ 개인 정보 수정은 비밀번호를 반드시 입력해야합니다.</h6>
									</div>
								</div>
								<div class="d-flex justify-content-around">
									<button id="emptyMyInfoFormBtn" class="btn btn-outline-secondary btn-lg" type="button" onclick="emptyMyInfoForm()">비우기</button>
									<button id="bringMyInfoFormBtn" class="btn btn-outline-secondary btn-lg" type="button" onclick="bringMyInfoForm()">내정보 가져오기</button>
									<button id="changeMyInfoBtn" class="btn btn-outline-info btn-lg" >저장</button>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
	
	// 저장되어 있는 내정보 폼으로 불러오기
	function bringMyInfoForm() {
	    $('#acName').val("${account.acName}"); 
	    $('#acEmail').val("${account.acEmail}"); 
	    $('#acTel').val("${account.acTel}");
	}
	
	// 내정보 폼에 입력되어 있는 내용 비우기
	function emptyMyInfoForm() {
	    $('#acName').val('');
	    $('#acEmail').val('');
	    $('#acTel').val('');
	}
	
	function changeMyInfo(){
		var acName = $('#acName').val();
		var acEmail = $('#acEmail').val();
		var acTel = $('#acTel').val();
		var acPassword = $('#acPassword').val();
		var acPasswordCheck = $('#acPasswordCheck').val();
		
		event.preventDefault();
		
		var totalResult = true;
		
		//1)Name 검사 -------------------------------------------------------
		var acNamePattern = /^[가-힣]{2,5}$/;			
		var acNameResult = acNamePattern.test(acName);
		var el_acName_alarm = document.querySelector("#acNameAlarm");
		if(acNameResult) {
			$("#acNameAlarm").removeClass("text-danger");
			$("#acNameAlarm").addClass("text-light");
		} else {
			$("#acNameAlarm").addClass("text-danger");
			$("#acNameAlarm").removeClass("text-light");
			totalResult = false; 
		}
		
		//2)Email 검사 -------------------------------------------------------
		var acEmailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var acEmailResult = acEmailPattern.test(acEmail);
		var el_acEmail_alarm = document.querySelector("#acEmailAlarm");
		if(acEmailResult) {
			$("#acEmailAlarm").removeClass("text-danger");
			$("#acEmailAlarm").addClass("text-light");
		} else {
			$("#acEmailAlarm").text("이메일 형식이 아닙니다.");
			$("#acEmailAlarm").removeClass("text-light");
			$("#acEmailAlarm").addClass("text-danger");
			totalResult = false;
		}
		
		//3)Tel 검사 -------------------------------------------------------
		
		var acTelPattern = /^(010|011)-\d{3,4}-\d{4}$/;
		var acTelResult = acTelPattern.test(acTel);
		var el_acTel_alarm = document.querySelector("#acTelAlarm");
		if(acTelResult) {
			$("#acTelAlarm").removeClass("text-danger");
			$("#acTelAlarm").addClass("text-light");
		} else {
			$("#acTelAlarm").text("전화번호 형식이 아닙니다.");
			$("#acTelAlarm").addClass("text-danger");
			$("#acTelAlarm").removeClass("text-light");
			totalResult = false;
		}
		
		//4)Password 검사 -------------------------------------------------------
		
		var acPasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
		var acPasswordResult = acPasswordPattern.test(acPassword);
		var el_acPassword_alarm = document.querySelector("#acPasswordAlarm");
		if(acPasswordResult) {
			$("#acPasswordAlarm").removeClass("text-danger");
			$("#acPasswordAlarm").addClass("text-light");
		} else {
			$("#acPasswordAlarm").addClass("text-danger");
			$("#acPasswordAlarm").removeClass("text-light");
			totalResult = false;
		}
		
		//4)PasswordCheck 검사(비밀번호 일치) -------------------------------------------------------
		
		if(acPasswordCheck == null || acPasswordCheck == '') {
			$("#acPasswordCheckAlarm").removeClass("text-light");
			$("#acPasswordCheckAlarm").addClass("text-danger");
		} else {
			if(acPassword == acPasswordCheck) {
				$("#acPasswordCheckAlarm").removeClass("text-danger");
				$("#acPasswordCheckAlarm").addClass("text-light");
			} else if(acPassword!=acPasswordCheck) {
				$("#acPasswordCheckAlarm").text("입력한 비밀번호가 일치하지 않습니다.");
				totalResult = false;
			}
		}
		
		//5)비밀번호 not null 검사  --------------------------------------------------
		if(acPassword == null || acPassword == '' || acPasswordCheck == null || acPasswordCheck == '') {
			$("#changeMyInfoAlarm").removeClass("text-light");
			$("#changeMyInfoAlarm").addClass("text-danger");
			totalResult = false;
		} else {
			$("#changeMyInfoAlarm").addClass("text-light");
			$("#changeMyInfoAlarm").removeClass("text-danger");
		}	
		
		//6)전체 유효성 검사 결과가 true일 경우  --------------------------------------------------
		if(totalResult) {
			var account = {
					acName, 
					acEmail,
					acTel,
					acPassword,
					acPasswordCheck						
			}	
			
			//내정보 카드를 비동기 방식으로 변경해줌
			$.ajax({
					url : "myInfoChange",
					type : "post",
					data : account,
					success: function(response){
						console.info("요청 성공");
						$('#myInfoDetailBox').html(response);
							         
						},
			  		error: function(xhr, status, error){
			  			console.info("요청 안됨");
			  		}
			});  	
		} 		
	} 
	
	// 마이페이지 내가 쓴 글 띄우는 AJAX
	function myWriteBoardHistory(pageNo=1) {
		
		$.ajax({
			url: 'myWriteBoardHistory',
 			type: 'get',
 			data: {pageNo: pageNo},	
 			success: function(response){
 				$("#innerContainer").html(response);
 			}, 
 			error: function(xhr, status, error){
 				console.error(xhr.responseText);
 			}
		});
	}
	
	function myWriteBoardCommentHistory(pageNo=1) {
		
		$.ajax({
			url: 'myWriteBoardCommentHistory',
 			type: 'post',
 			data: {pageNo: pageNo},	
 			success: function(response){
 				$("#innerContainer").html(response);
 			}, 
 			error: function(xhr, status, error){
 				console.error(xhr.responseText);
 			}
		});
	}
	
	function myPaymentHistory() {
		
		$.ajax({
			url: 'myPayment',
 			type: 'get',
 			success: function(response){
 				$("#innerContainer").html(response);
 			}, 
 			error: function(xhr, status, error){
 				console.error(xhr.responseText);
 			}
		});
	}
	
	function myAccount() {
		console.log("개인정보 실행")
		$.ajax({
			url: 'myAccount',
 			type: 'get',
 			success: function(response){
 				$("#innerContainer").html(response);
 			}, 
 			error: function(xhr, status, error){
 				console.error(xhr.responseText);
 			}
		});
	}
	
	</script>
</body>
</html>