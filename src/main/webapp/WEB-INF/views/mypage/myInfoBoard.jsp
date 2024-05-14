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
<title>Offcanvas Example</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
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
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="p-5">
			<div class="container-fluid bg-white rounded-4 p-0 shadow-lg" style="height:80%">
				<div class="d-flex flex-row">
					<div class="d-flex col flex-column flex-shrink-0 p-3 text-white bg-dark rounded-start-4" style="max-width: 280px; min-width: 280px;">
						<a href="/" class="d-flex justify-content-center align-items-center text-white text-decoration-none"> <span class="fs-4 pfont">마이 페이지</span>
						</a>
						<hr>
						<ul class="nav nav-pills flex-column mb-auto">
							<li><a href="#" class="nav-link text-white fs-3 pfont"> <i class="bi bi-speedometer me-2"></i> 대시보드
							</a></li>
							<li><a href="#" class="nav-link text-white fs-3 pfont" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
									<i class="bi bi-box me-2"></i> 주문 기록
							</a>
								<div class="collapse" id="dashboard-collapse">
									<ul class="ms-2">
										<li><a href="#" class="text-white text-decoration-none">상품 목록</a></li>
										<li><a href="#" class="text-white text-decoration-none">상품 등록</a></li>
										<li><a href="#" class="text-white text-decoration-none">상품 관리</a></li>
										<li><a href="#" class="text-white text-decoration-none">상품 삭제</a></li>
									</ul>
								</div></li>
							<li><a href="#" class="nav-link text-white fs-3 pfont" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
									<i class="bi bi-person-video2 me-2"></i> 개인정보
							</a>
								<div class="collapse" id="account-collapse">
									<ul class="ms-2">
										<li><a href="#" class="text-white text-decoration-none">계정 목록</a></li>
										<li><a href="#" class="text-white text-decoration-none">계정 등록</a></li>
										<li><a href="#" class="text-white text-decoration-none">계정 관리</a></li>
										<li><a href="#" class="text-white text-decoration-none">계정 삭제</a></li>
									</ul>
								</div></li>
							<li><a href="#" class="nav-link text-white fs-3 pfont" data-bs-toggle="collapse" data-bs-target="#board-collapse" aria-expanded="false">
									<i class="bi bi-chat-left-text me-2"></i> 활동 내역
							</a>
								<div class="collapse" id="board-collapse">
									<ul class="ms-2">
										<li><a href="#" class="text-white text-decoration-none">작성한 글</a></li>
										<li><a href="#" class="text-white text-decoration-none" onclick="myWriteBoardHistory()">작성한 댓글</a></li>
									</ul>
								</div></li>
						</ul>
						<hr>
						<div class="dropdown">
							<a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown"
								aria-expanded="false"> <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2"> <strong>dd</strong>
							</a>
							<ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
								<li><a class="dropdown-item" href="#">New project...</a></li>
								<li><a class="dropdown-item" href="#">Settings</a></li>
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#">Sign out</a></li>
							</ul>
						</div>
					</div>
					
					<!-- AJAX로 변경하는 시작점 -->
					<div id="innerContainer">
					<div class="p-5 d-flex align-items-center">
						<div id="hovershadow" class="p-5 rounded-4 d-flex flex-column align-items-center" style="background-color: #F0F0F0;">
							<img src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png" width="200px" class="rounded-4 mt-5 ms-5 me-5" />
							<div class="row h5 text-secondary mb-5 pfont">admin</div>
							<div class="row h1 text-dark pfont">김이박</div>
							<div class="row h5 text-info mb-5 pfont">email@ema.il</div>
							<div class="row h3 text-dark pfont">010-1234-5678</div>
						</div>
					</div>
					<div class="p-5 flex-grow-1 d-flex align-items-center">
						<div id="hovershadow" class="d-grid gap-4 p-5 bg-dark rounded-4 w-100">
							<div class="row text-center">
								<h1 class="text-light pfont">개인정보 수정</h1>
							</div>
							<div class="row">
								<div class="col-4">
									<img src="${pageContext.request.contextPath}/resources/image/cut/PineapplePassionfruitRefreshersLemonade.png" width="100%">
									<div class="input-group">
										<input type="file" class="form-control btn btn-outline-secondary" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"
											aria-label="Upload">
									</div>
								</div>
								<div class="col-8 flex-column d-grid gap-4 ps-5 pe-4">
									<div class="row">
										<label class="form-label h4 text-light pfont align-text-bottom">Name</label> <input class="form-control" list="datalistOptions" id="nameForm">
									</div>
									<div class="row">
										<label class="form-label h4 text-light pfont">E-Mail</label> <input class="form-control" placeholder="Type to search...">
									</div>
									<div class="row">
										<label class="form-label h4 text-light pfont">Tel</label> <input class="form-control" placeholder="Type to search...">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<label class="form-label h4 text-light pfont">PW</label> <input class="form-control" list="datalistOptions" placeholder="Type to search...">
								</div>
								<div class="col">
									<label class="form-label h4 text-light pfont">Confirm PW</label> <input class="form-control" list="datalistOptions"
										placeholder="Type to search...">
								</div>
							</div>
							<div class="d-flex justify-content-around">
								<button class="btn btn-outline-info btn-lg">저장</button>
								<button class="btn btn-outline-secondary btn-lg">비우기</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	<script>
	
	// 마이페이지 내가 쓴 글 띄우는 AJAX
	function myWriteBoardHistory(pageNo=1) {  
		$.ajax({
			url: 'myWriteBoardHistory',
 			type: 'get',
 			success: function(response){
 			data: { searchText: searchInput, pageNo: pageNo},	
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