<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<nav class="navbar navbar-expand-lg shadow bg-body rounded" style="height: 100px">
	<div class="container-fluid">
		<a class="navbar-brand ms-5 ps-5 " href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/image/codebrew.png" style="width: 50px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<img src="${pageContext.request.contextPath}/resources/image/codebrew.png" style="width: 50px">
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-start flex-grow-1 ms-3 mt-2 mb-2">
					<li class="nav-item ms-2"><a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/mypage">Information</a></li>
					<li class="nav-item ms-2"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/paymentList">Payment List</a></li>
					<li class="nav-item ms-2"><a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">Board</a></li>
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
				<div class="d-flex justify-content-around align-items-center">
					<a href="${pageContext.request.contextPath}/signJoin/joinNow"><button class="btn btn-dark btn-md rounded-pill border ms-2 me-4">Logout</button></a>
				</div>
			</div>
		</div>
	</div>
</nav>