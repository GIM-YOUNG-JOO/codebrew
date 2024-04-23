<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 삭제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">
</head>

<body>
<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>
        <div class="container-fluid d-flex justify-content-center mt-5">
        <div class="overflow-hidden card table-nowrap shadow" style="width:900px; min-width: 600px;">
            <div class="card-header bg-black text-white">
                Product List
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead class="text-uppercase">
                        <tr>
                            <th class="col-1">상품코드</th>
                            <th class="col-2">이미지</th>
                            <th class="col-4">상품명</th>
                            <th class="col-2">카테고리</th>
                            <th class="col-2">가격</th>
                            <th class="col-1">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="align-middle">
                            <!-- 상품 코드 -->
                            <td>1</td>
                            <!-- 상품명 -->
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/image/Americano_cut.jpg" alt="Coffee" width="50px">
                            </td>
                            <td>
                                Hot Coffee
                            </td>
                            <!-- 카테고리 -->
                            <td>커피</td>
                            <!-- 가격 -->
                            <td>5000</td>
                            <!-- 관리 -->
                            <td>
                                <button class="btn btn-danger btn-md rounded-pill border">Delete</button>
                            </td>
                        </tr>
                        <tr class="align-middle">
                            <!-- 상품 코드 -->
                            <td>2</td>
                            <!-- 상품명 -->
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/image/Americano_cut.jpg" alt="Coffee" width="50px">
                            </td>
                            <td>
                                Hot Coffee
                            </td>
                            <!-- 카테고리 -->
                            <td>커피</td>
                            <!-- 가격 -->
                            <td>5000</td>
                            <!-- 관리 -->
                            <td>
                                <button class="btn btn-danger btn-md rounded-pill border">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>