<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg shadow bg-body rounded" style="height: 100px">
        <div class="container-fluid">
            <a class="navbar-brand ms-4" href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/resources/image/javabean.webp"
                    style="height: 70px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header mt-3">
                    <img src="${pageContext.request.contextPath}/resources/image/javabean.webp" style="height: 70px">
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-start flex-grow-1 ms-3 mt-2 mb-2">
                    	<li class="nav-item dropdown ms-2">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard" role="button">Dashboard</a>
                        </li>
                        <li class="nav-item dropdown ms-2">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Product
                            </a>
                            <ul class="dropdown-menu">

                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/productList">상품 목록</a></li>
                                <li><a class="dropdown-item" href="#">재고 관리(미구현)</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/productRegistration">상품 등록</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/productDelete">상품 삭제(edit에 구현)</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/menu">메뉴 페이지로 이동</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown ms-2">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Account
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/accountList">고객 관리</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">블랙 리스트</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>