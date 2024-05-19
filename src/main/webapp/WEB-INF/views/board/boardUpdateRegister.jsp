<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 작성</title>
    <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
    <!-- Latest compiled and minified CSS -->
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
    
    <!-- Latest compiled JavaScript -->
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery -->
    <script
    src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 폰트 설정을 위한 링크 추가 -->
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- 아이콘 추가 링크 -->
    <!-- 초기화 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- 위지윅 HTML 에디터 cdn 추가 -->
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
	
	<!-- alert 레이아웃 외부 라이브러리 사용 설정  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardRegister.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://cdn.tiny.cloud/1/q1ztz0dzw4cplndsd7c2q2n21lddorqil2kaqrmhenhmfi8w/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    
    <script>
      tinymce.init({
        selector: '#mytextarea',
        menubar: false,
        toolbar: '| bold aligncenter alignjustify alignleft alignright alignnone'
      });
      
    function imageAddAndBlock(event){
       
       event.preventDefault();
       console.log("이미지 추가 실행");
       document.getElementById('battach').click();
    }
    
    function displayFileName() {
        const fileInput = document.getElementById('battach');
        const fileNameDisplay = document.getElementById('fileNameDisplay');
        
        // 파일이 선택되지 않았을 경우 표시할 메시지
        if (!fileInput.files.length) {
            fileNameDisplay.textContent = "파일이 선택되지 않았습니다.";
            document.getElementById("updateCheck").value = -1; 
            return;
        }
        
        // 선택한 파일의 이름을 표시
        const fileName = fileInput.files[0].name;
        fileNameDisplay.textContent = fileName;
        document.getElementById("updateCheck").value = 1; 
    }
    
    
    function clickedNoticeButton() {
       event.preventDefault();
       // 버튼 클릭시 category 값 변경
        document.getElementById("category").value = 1;
        
       // 클릭시 색상 변경
        document.getElementById("noticeButton").style.backgroundColor = "#2C4E80";
        document.getElementById("noticeButton").style.color = "#fff";
        
        
        document.getElementById("reviewButton").style.backgroundColor = "";
        document.getElementById("reviewButton").style.color = "#000";
        
    }
    
    function clickedReviewButton() {
       event.preventDefault();
       // 버튼 클릭시 category 값 변경
        document.getElementById("category").value = 2; 
        
        // 클릭시 색상 변경
        document.getElementById("reviewButton").style.backgroundColor = "#2C4E80";
        document.getElementById("reviewButton").style.color = "#fff";
        

        document.getElementById("noticeButton").style.backgroundColor = "";
        document.getElementById("noticeButton").style.color = "#000";
        
    }
    
    // 게시판 수정 시 제목과 내용에 입력된 값이 없으면 alert를 리턴하는 함수
    function boardUpdateRegist(event) {
        event.preventDefault();
        var boardUpdateRegistResult = true;

     	// 제목을 입력 안했을 때
        if($('#btitle').val() == null || $('#btitle').val() == '') {
          swal({ 
            title: "Error",
            text: "제목을 입력해주세요.",
            icon: "error"
          });
          boardUpdateRegistResult = false;
        }
        
     	// 내용을 입력 안했을 때
        if(tinymce.get('mytextarea').getContent() == '') {
          swal({
            title: "Error",
            text: "내용을 입력해주세요.",
            icon: "error"
          });
          boardUpdateRegistResult = false;
        }
        
     	// 모두 입력 했을 때
        if(boardUpdateRegistResult) {
          $('#updateRegister').submit();
        }
     }

    </script>
    
    <style>
body {
	font-family: "Do Hyeon", sans-serif;
	font-weight: 400;
	font-style: normal;	
}
.button_tags.hover_grey.button.register_btn.rounded-1{
	background:#1f3933 !important;	
}

.info_box{
	background:#1f3933 !important;
	border-radius: 5px !important;
}
.register_button.round_box.btn.btn-md{
	background:#1f3933 !important;
}
</style>
    
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   
    <div class="container ss mt-3">
    <!-- action의 이름으로 컨트롤러 이동 -->
    <form id="updateRegister" method="post" action="updateRegister" enctype="multipart/form-data">
        <div class="nav_bar ss">
        
           <c:if test="${account.acRole == 'ROLE_ADMIN'}">
              <button id="noticeButton" class="button_tags hover_grey button register_btn rounded-1" value="1" onclick="clickedNoticeButton()">공지사항</button>
           </c:if>
           
            <button id="reviewButton" class="button_tags hover_grey button register_btn rounded-1" value="2" onclick="clickedReviewButton()" style="background-color:#2C4E80; color:#FFFFFF;">Review</button>
        </div>

        <div class="info_box ss">
            <div class="info_left_box ss me-2">
                 <svg class="image_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M448 80c8.8 0 16 7.2 16 16V415.8l-5-6.5-136-176c-4.5-5.9-11.6-9.3-19-9.3s-14.4 3.4-19 9.3L202 340.7l-30.5-42.7C167 291.7 159.8 288 152 288s-15 3.7-19.5 10.1l-80 112L48 416.3l0-.3V96c0-8.8 7.2-16 16-16H448zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm80 192a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"/></svg>
            </div>
            <div class="info_rigth_box ss">
                <span>이미지는 최대 1장까지만 넣을 수 있습니다.</span>
            </div>
        </div>
        
        <!-- input hidden으로 값 전달 -->
        <input type="hidden" id="category" name="category" value="2">
        <input type="hidden" id="updateCheck" name="boUpdateCheck" value="0">
        <input type="hidden" id="boId" name="boId" value="${board.boId}">
         <div class="title_box ss">
            <!-- 제목 -->
            <input id="btitle" type="text" name="boTitle"
               class="title form-control" placeholder="제목을 입력해주세요" value="${board.boTitle}">
         </div>
         <!-- action을 통해서 Controller를 타고 가서 boardDetail로 변경해야함 -->
         <!-- 내용 -->
         <textarea id="mytextarea" name="boContent" placeholder="내용을 입력해주세요"></textarea>
         <div class="mb-4"></div>

         <!-- 버튼 -->
         <div class="bottom_button ss">
            <div id="fileNameDisplay" class="me-5"></div>
            
            <!-- 이미지 변경시 이름 미리보기 설정 -->
            <input type="file" id="battach" name="boAttach"
               style="display: none;" onchange="displayFileName()" value="${board.boAttachdata}"/>

            <!-- 이미지 추가 버튼 클릭시 파일 선택 -->
            <button class="insert_button round_box ss btn btn-md me-4"
               onclick="imageAddAndBlock(event);">이미지 수정</button>
            <!-- <button class="insert_button round_box ss btn btn-md me-4"
               onclick="imageAddAndBlock(event);">이미지 삭제</button> -->
            <a class="cancel_button round_box ss btn btn-md me-4"
               href="boardList">취소</a>
            <button type="button"
               class="register_button round_box ss btn btn-md" onclick="boardUpdateRegist(event);">수정</button>
         </div>
      </form>
   </div>

    
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    
    <!-- 수정시 원래 Content 받아오는 식 -->
    <script>
          document.getElementById("mytextarea").value = "${board.boContent}";
    </script>
    
</body>
</html>