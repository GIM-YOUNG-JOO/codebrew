<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="d-flex col flex-column flex-shrink-0 p-3 text-white bg-dark h-100 rounded-start-4"
	style="max-width: 280px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
	<a href="${pageContext.request.contextPath}" class="d-flex justify-content-center align-items-center text-white text-decoration-none"> <span class="fs-4">Code Brew</span>
	</a>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">
		<li><a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link text-white"> <i class="bi bi-speedometer me-2"></i> Dashboard
		</a></li>
		<li><a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false"> <i
				class="bi bi-box me-2"></i> Product
		</a>
			<div class="collapse" id="dashboard-collapse">
				<ul class="ms-2">
					<li><a href="${pageContext.request.contextPath}/admin/productList" class="text-white text-decoration-none">상품 목록</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/productRegistration" class="text-white text-decoration-none">상품 등록</a></li>
					<li><a href="#" class="text-white text-decoration-none">재고 관리(미구현)</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/productDelete" class="text-white text-decoration-none">상품 삭제</a></li>
				</ul>
			</div></li>
		<li><a href="${pageContext.request.contextPath}/admin/accountList" class="nav-link text-white" aria-expanded="false"> <i
				class="bi bi-person-video2 me-2"></i> Account
		</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/orderManagement" class="nav-link text-white"> <i class="bi bi-cup me-2"></i> Order
		</a></li>
	</ul>
	<hr>
	<div class="dropdown">
		<a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown"
			aria-expanded="false"> <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
			<strong>username</strong>
		</a>
		<ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
<!-- 		<li><a class="dropdown-item" href="#">New project...</a></li>
			<li><a class="dropdown-item" href="#">Settings</a></li>
			<li><a class="dropdown-item" href="#">Profile</a></li>
			<li>
				<hr class="dropdown-divider">
			</li> -->
			<li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Sign out</a></li>
		</ul>
	</div>
</div>