<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code Brew - BoardList</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- jquery 외부 라이브러리 사용 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardDetail.css"> --%>
    <style>
        .card {
            margin-top: 10px;
        }
    </style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
        <div class="d-flex">
            <div class="border p-5 d-flex flex-column position-sticky top-0 vh-100" style="width:50%;">
                <div class="d-flex">
                    <div class="h1">
                    	글 제목
                    </div>
                    <div class="d-flex justify-content-end align-items-center flex-grow-1">
                        <button class="btn btn-lg bi bi-hand-thumbs-up"></button>
                        <span class="h5 m-1">1</span>
                        <button class="btn btn-lg bi bi-hand-thumbs-down"></button>
                    </div>
                </div>
                <hr />
                <div class="p-4 border shadow flex-grow-1 mb-5" style="width:100%;">
                    <p>글 내용을 적자<br>왕창 적자</p>
                </div>
                <div class="input-group shadow" style="width:100%; height: 15%;">
                    <textarea class="form-control" aria-label="With textarea" style="background-color: white;"></textarea>
                    <button class="btn btn-dark">댓글 등록</button>
                </div>
            </div>
            <div style="width:50%">
                <div class="d-flex justify-content-center p-5">
                    <img src="${pageContext.request.contextPath}/resources/image/cut/AppleJuice.png" alt="" width="auto" height="300px">
                </div>
                <div class="d-flex align-items-center flex-column">
                    <div class="h1"> Comment </div>
                    <div class="card" style="width: 80%;">
                        <div class="card-body">
                            <h5 class="card-title">댓글 ID</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">댓글 시간</h6>
                            <p class="card-text">댓글 내용 가나다라마바사아자차카타파하<br>댓글 내용 가나다라마바사아자차카타파하</p>
                            <div class="card-link text-end">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="ms-2 me-2">1</span>
                                <i class="bi bi-hand-thumbs-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card" style="width: 80%;">
                        <div class="card-body">
                            <h5 class="card-title">댓글 ID</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">댓글 시간</h6>
                            <p class="card-text">댓글 내용 가나다라마바사아자차카타파하<br>댓글 내용 가나다라마바사아자차카타파하</p>
                            <div class="card-link text-end">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="ms-2 me-2">1</span>
                                <i class="bi bi-hand-thumbs-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card" style="width: 80%;">
                        <div class="card-body">
                            <h5 class="card-title">댓글 ID</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">댓글 시간</h6>
                            <p class="card-text">댓글 내용 가나다라마바사아자차카타파하<br>댓글 내용 가나다라마바사아자차카타파하</p>
                            <div class="card-link text-end">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="ms-2 me-2">1</span>
                                <i class="bi bi-hand-thumbs-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card" style="width: 80%;">
                        <div class="card-body">
                            <h5 class="card-title">댓글 ID</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">댓글 시간</h6>
                            <p class="card-text">댓글 내용 가나다라마바사아자차카타파하<br>댓글 내용 가나다라마바사아자차카타파하</p>
                            <div class="card-link text-end">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="ms-2 me-2">1</span>
                                <i class="bi bi-hand-thumbs-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card" style="width: 80%;">
                        <div class="card-body">
                            <h5 class="card-title">댓글 ID</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">댓글 시간</h6>
                            <p class="card-text">댓글 내용 가나다라마바사아자차카타파하<br>댓글 내용 가나다라마바사아자차카타파하</p>
                            <div class="card-link text-end">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="ms-2 me-2">1</span>
                                <i class="bi bi-hand-thumbs-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card" style="width: 80%;">
                        <div class="card-body">
                            <h5 class="card-title">댓글 ID</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">댓글 시간</h6>
                            <p class="card-text">댓글 내용 가나다라마바사아자차카타파하<br>댓글 내용 가나다라마바사아자차카타파하</p>
                            <div class="card-link text-end">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="ms-2 me-2">1</span>
                                <i class="bi bi-hand-thumbs-down"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>  
</body>
</html>