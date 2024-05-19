<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">

</head>

<body>
	<%@ include file="/WEB-INF/views/common/myPageHeader.jsp"%>
	<form>
        <div class="container-fluid d-flex justify-content-center mt-5">
            <div class="overflow-hidden card table-nowrap shadow" style="width:900px; min-width: 600px;">
                <div class="card-header bg-black text-white">
                    회원 정보
                </div>
                <div class="d-flex">
                    <div class="d-flex flex-column flex-grow-1 h-100">
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">아이디</span>
                            <span class="input-group-text flex-grow-1" id="basic-addon1">abc123</span>
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">이름</span>
                            <input type="text" class="form-control" placeholder="감자바" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">전화번호</span>
                            <input type="text" class="form-control" placeholder="010-1234-5678" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">이메일</span>
                            <input type="text" class="form-control" placeholder="codebrew@java.com" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text text-center" id="basic-addon1">새 비밀번호</span>
                            <input type="text" class="form-control" placeholder="" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">새 비밀번호 확인</span>
                            <input type="text" class="form-control" placeholder="" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <div class="d-flex justify-content-around">
                    <button class="btn btn-success p-2 m-3" style="width:150px">정보 수정</button>
                    <button class="btn btn-danger p-2 m-3" style="width:150px">계정 삭제</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>