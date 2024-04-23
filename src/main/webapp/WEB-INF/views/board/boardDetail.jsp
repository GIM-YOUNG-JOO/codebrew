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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardDetail.css">
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="flex_container">
        <div class="container_right">
            <div class="first_box">
                <h3 class="first_h3">[ 이벤트/프로모션>프리퀀시 ] [e-프리퀀시] 스티커 형태로 된 (구) e-프리퀀시 바코드로도 적립 및 사용이 가능한가요?</h3>
                <p class="first_p">24.04.22 11:22 작성 <span>조회수 9</span></p>
            </div>
            <div class="flex_container2">
                <div class="container2_right ">
                    <div class="aa">
                        <i class="fa fa-thumbs-o-up"></i>
                    </div>
                    <div class="aa">
                        <h3 class="likeNumber">19</h3>
                    </div>
                    <div class="aa">
                        <i class="fa fa-thumbs-o-down"></i>
                    </div>
                </div>
                <div class="container2_left ">
                   
                </div>
            </div>
            <div class="third_box">
                <div class="third_inner_box">
                    
                    <button class="third_inner_box_button1 btn btn-success">
                        <svg  class="saveText" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V173.3c0-17-6.7-33.3-18.7-45.3L352 50.7C340 38.7 323.7 32 306.7 32H64zm0 96c0-17.7 14.3-32 32-32H288c17.7 0 32 14.3 32 32v64c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V128zM224 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                        	저장
                    </button>
                    <button class="third_inner_box_button2 btn btn-success">
                        <svg class="shareText" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M418.4 157.9c35.3-8.3 61.6-40 61.6-77.9c0-44.2-35.8-80-80-80c-43.4 0-78.7 34.5-80 77.5L136.2 151.1C121.7 136.8 101.9 128 80 128c-44.2 0-80 35.8-80 80s35.8 80 80 80c12.2 0 23.8-2.7 34.1-7.6L259.7 407.8c-2.4 7.6-3.7 15.8-3.7 24.2c0 44.2 35.8 80 80 80s80-35.8 80-80c0-27.7-14-52.1-35.4-66.4l37.8-207.7zM156.3 232.2c2.2-6.9 3.5-14.2 3.7-21.7l183.8-73.5c3.6 3.5 7.4 6.7 11.6 9.5L317.6 354.1c-5.5 1.3-10.8 3.1-15.8 5.5L156.3 232.2z"/></svg>
                        	공유
                    </button>
                </div>
            </div>
            <div class="under_line"></div>
            <h5 class="reply">답변 <span>1</span>
            </h5>
            <div class="reply_write">
                
            </div>
            <div class="reply_containner">
                <div class="reply_write_inner_box">
                    <button class="btn btn-secondary">취소</button>
                    <button class="btn btn-success">등록</button>
                </div>
            </div>
            <div class="flex_container3">
                <div class="container3_left">
                    <div class="aa">
                        <i class="fa fa-thumbs-o-up"></i>
                    </div>
                    <div class="aa">
                        <h3 class="likeNumber2">2</h3>
                    </div>
                    <div class="aa">
                        <i class="fa fa-thumbs-o-down"></i>
                    </div>
                </div>
                <div class="container3_right"></div>
            </div>
        </div>
        <div class="container_left ">
            <div class="container_left_first_box">
                <div class="container_left_first_box_right dd"></div>
                <div class="container_left_first_box_left dd">
                    <img src="" alt="">
                </div>
            </div>
            <div class="container_left_second_box dd">
                <div class="container_left_second_box_one"></div>
                <div class="container_left_second_box_two"></div>
                <div class="container_left_second_box_three"></div>
            </div>
            <div class="container_left_third_box dd">
                
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>  
</body>
</html>