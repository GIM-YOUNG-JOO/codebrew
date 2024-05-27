<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!--nav바 위의 상단바 필요할 시 활용
        <div class="d-flex justify-content-end">
        <a href="#" class=""><i class="me-2 bi-person-circle"></i>
            <span class="d-none d-md-inline-block">회원가입</span></a>
        <span class="mx-md-2 d-inline-block"></span>
        <a href="#" class=""><span class="me-2 bi-person-circle"></span> <span
                class="d-none d-md-inline-block">로그인</span></a>
        <span class="mx-md-2 d-inline-block"></span>
        <a href="#" class=""><span class="me-2 bi-person-circle"></span> <span
                class="d-none d-md-inline-block">주문조회</span></a>
        <span class="mx-md-2 d-inline-block"></span>
        <a href="#" class=""><span class="me-2 bi-person-circle"></span> <span
                class="d-none d-md-inline-block">고객센터</span></a>
    </div> -->
<nav class="navbar navbar-expand-lg shadow-sm bg-body rounded" style="height: 100px">
	<div class="container-fluid">
		<a class="navbar-brand p-0 ms-5" href="${pageContext.request.contextPath}">
		<img src="${pageContext.request.contextPath}/resources/image/codebrew.jpg" class="rounded-circle" style="width: 80px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header justify-content-between">
				<img src="${pageContext.request.contextPath}/resources/image/codebrew.jpg" class="rounded-circle"style="width: 80px">
				<sec:authorize access="isAnonymous()">
					<span class="flex-grow-1 text-center">CodeBrew에 오신걸 환영합니다.</span>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<span class="flex-grow-1 text-center"><sec:authentication property="principal.username"/> 님, 환영합니다.</span>
				</sec:authorize>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body justify-content-between">
				<ul class="navbar-nav ps-3">
					<li class="nav-item"><a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/order/menu">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/myInfo">마이 페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">게시판</a></li>
					<!-- 드롭다운 메뉴 쓸 경우를 대비해 유지
                             <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li> -->
				</ul>
				<hr>
				<div>
					<sec:authorize access="isAnonymous()">
						<a href="${pageContext.request.contextPath}/signJoin/signIn"><button class="btn btn-light btn-md rounded-pill border ms-4 me-2">로그인</button></a>
						<a href="${pageContext.request.contextPath}/signJoin/joinNow"><button class="btn btn-dark btn-md rounded-pill border ms-2 me-4">회원가입</button></a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-dark rounded-pill me-4">로그아웃</a>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
</nav>