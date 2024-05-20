<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Code Brew - BoardList</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 제이쿼리 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- moment.js 라이브러리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<!-- 폰트 설정을 위한 링크 추가 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boardList.css">

<script>
	function redirectToBoardList(){
		window.location.href = "http://localhost:8080/codebrew/board/boardList"
	}

</script>


<style>
body {
	font-family: "Do Hyeon", sans-serif;
	font-weight: 400;
	font-style: normal;	
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br>
	<div class="first_box">
		<div class="first_in_box">
			<h3 class="mb-3">자유 게시판</h3>
			<div>리뷰를 남겨주세요</div>
		</div>
	</div>

	<div class="main">
	<!-- 이후에 공지사항이랑 리뷰로 나눠서 사용할 때 사용하시면 됩니다. -->
		<!-- <div class="left_box ss">
			<li class="side_bar_first_box ss">
			    <a href="#" id="noticeLink" onclick="clickedNoticeButton()">
			        <div class="side_bar mb-1" style="text-align: center;" >공지 사항</div>
			    </a>
			</li>

			<li class="side_bar_first_box ss">
				<a href="#" id="reviewLink" onclick="clickedReviewButton()">
					<div class="side_bar mb-1" style="text-align: center;">Review</div>
				</a>
			</li>
		</div> -->

		<div class="main_text_box mb-3">
			<div class="first_input_box mb-2">
				<div class="search_input_box">
					<div class="search_flex_box">
						<div class="ss icon">
							<svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
								<path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M11.5 7c0 .59-.116 1.176-.343 1.722-.226.546-.557 1.042-.975 1.46-.418.418-.914.75-1.46.975-.546.226-1.131.343-1.722.343-.59 0-1.176-.117-1.722-.343-.546-.226-1.042-.557-1.46-.975-.418-.418-.75-.914-.975-1.46C2.616 8.176 2.5 7.591 2.5 7c0-1.194.474-2.338 1.318-3.182C4.662 2.974 5.807 2.5 7 2.5c1.193 0 2.338.474 3.182 1.318C11.026 4.662 11.5 5.806 11.5 7zm-.82 4.74c-1.206.936-2.723 1.377-4.242 1.234-1.52-.143-2.928-.86-3.937-2.005C1.49 9.825.956 8.34 1.004 6.813c.047-1.526.675-2.976 1.754-4.055 1.08-1.08 2.53-1.707 4.055-1.755 1.525-.047 3.012.488 4.156 1.498 1.145 1.01 1.862 2.417 2.005 3.937.143 1.52-.298 3.036-1.234 4.242l3.04 3.04c.074.069.133.151.174.243.04.092.063.192.065.292.001.101-.017.201-.055.294-.038.094-.094.179-.165.25-.071.071-.156.127-.25.165-.093.038-.193.056-.293.054-.101-.001-.2-.023-.293-.064-.091-.041-.174-.1-.243-.174l-3.04-3.04z"></path></svg>
						</div>
						<input id="searchInput" class="input_box round_box" type="text" spellcheck="false" laceholder="제목을 검색해보세요!" onkeydown="enterKeyTitle(event)">
					</div>
				</div>
				<button class="search_button round_box" onclick="searchTitle()">검색</button>
			</div>

			<!-- <div class="first_input_box ss mb-4">
                <div class="search_input_box ss">
                    <div class="search_flex_box ss">
                        <div class="ss icon"><svg width="16" xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 16 16"><path fill="#3E4042" fill-rule="evenodd" d="M5.773 1.455c-.283 0-.518.216-.542.498L5 4.727H2.545c-.3 0-.545.244-.545.546 0 .301.244.545.545.545H4.91l-.364 4.364h-2c-.3 0-.545.244-.545.545 0 .301.244.546.545.546h1.91l-.224 2.684c-.027.317.224.588.542.588.282 0 .518-.216.541-.498l.231-2.774H9.91l-.224 2.684c-.026.317.224.588.542.588.283 0 .518-.216.542-.498L11 11.273h2.454c.302 0 .546-.245.546-.546 0-.301-.244-.545-.546-.545h-2.363l.364-4.364h2c.3 0 .545-.244.545-.545 0-.302-.244-.546-.546-.546h-1.909l.224-2.684c.027-.317-.224-.588-.542-.588-.282 0-.518.216-.541.498l-.232 2.774H6.091l.224-2.684c.026-.317-.224-.588-.542-.588zM6 5.818l-.364 4.364H10l.364-4.364H6z" clip-rule="evenodd"></path></svg></div>
                        <input class="input_box round_box" type="text" spellcheck="false" placeholder="태그로 검색해보세요!" enterkeyhint="search">
                    </div>
                </div>

                <button class="clear_button round_box align-middle">
                    <i class="bi bi-arrow-clockwise"></i>
                    초기화</button>
             </div> -->
			
			<!-- 정렬을 위한 버튼들 -->
			<div class="d-flex ss edit_box mb-2">
				<ul class="select_box">
					<li class="ss me-4"><button class="select_box_button" onclick="sortByDate()">최신순</button></li>
					<li class="ss me-4"><button class="select_box_button" onclick="sortByHitcount()">조회순</button></li>
					<li class="ss me-4"><button class="select_box_button" onclick="sortByLike()">좋아요순</button></li>
					<li class="ss me-4"><button class="select_box_button" onclick="sortByComment()">댓글순</button></li>
				</ul>

				<button class="insert_button round_box edit_button round_box"
					onclick="window.location.href='boardRegister'" style="color: white;"><svg width="16"
						height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
						<path fill="#ffffff" fill-rule="evenodd"
							d="M11.508 1.451c.456-.455 1.195-.455 1.65 0l1.724 1.724c.456.456.456 1.194 0 1.65L13.02 6.687l-.008.008-7.219 6.89c-.132.126-.291.22-.466.273l-3.681 1.12c-.177.054-.369.006-.5-.124-.13-.131-.178-.323-.124-.5l1.115-3.666c.059-.192.166-.365.311-.504L9.651 3.31l1.857-1.858zM9.992 4.366l-6.854 6.542c-.02.02-.036.044-.044.072l-.843 2.769 2.785-.848c.025-.007.048-.02.067-.039l6.848-6.537-1.96-1.96zm2.675 1.26l1.508-1.508c.065-.065.065-.17 0-.236l-1.724-1.724c-.065-.065-.17-.065-.236 0l-1.508 1.509 1.96 1.96z"
							clip-rule="evenodd"></path></svg> 글쓰기</button>
			</div>
			</ul>
			<hr/>
			
            <div id="boardContainer">
			    <table class="table table-sm table-bordered">
			    <!-- 게시판 내용 불러오는 코드 -->
			        <c:forEach var="board" items="${boardList}">
			            <ul class="question_list">
			                <li class="li mb-3">
			                    <a class="" href="boardDetail?boId=${board.boId}">
			                        <div class="question_info">
			                            <h4 class="title_text">${board.boTitle}</h4>
			                        </div>
			
			                        <p class="question_body">${board.boContent}</p>
			
			                        <div class="id_date_info d-flex ss">
			                            <div class="me-3">${board.acId}</div>
			                            <div id="formattedDate">
			                                <fmt:formatDate value="${board.boNewdate}" pattern="yy-MM-dd HH:mm:ss" />
			                            </div>
			                        </div>
			
			                        <div class="question_info_footer d-flex ss">
			                            <div class="ss footer_icon me-1">
			                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path
                                                    d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z" /></svg>
			                            </div>
			
			                            <div class="me-2" id="boLike">${board.boLike}</div>
			
			                            <div class="ss footer_icon me-1">
			                                 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z" /></svg>
			                            </div>
			                            <div class="me-2">${board.boHitcount}</div>
			
			                            <div class="ss footer_icon me-1">
			                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M123.6 391.3c12.9-9.4 29.6-11.8 44.6-6.4c26.5 9.6 56.2 15.1 87.8 15.1c124.7 0 208-80.5 208-160s-83.3-160-208-160S48 160.5 48 240c0 32 12.4 62.8 35.7 89.2c8.6 9.7 12.8 22.5 11.8 35.5c-1.4 18.1-5.7 34.7-11.3 49.4c17-7.9 31.1-16.7 39.4-22.7zM21.2 431.9c1.8-2.7 3.5-5.4 5.1-8.1c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208s-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6c-15.1 6.6-32.3 12.6-50.1 16.1c-.8 .2-1.6 .3-2.4 .5c-4.4 .8-8.7 1.5-13.2 1.9c-.2 0-.5 .1-.7 .1c-5.1 .5-10.2 .8-15.3 .8c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4c4.1-4.2 7.8-8.7 11.3-13.5c1.7-2.3 3.3-4.6 4.8-6.9c.1-.2 .2-.3 .3-.5z" /></svg>
			                                <!-- 댓글은 조인해서 가져와야함 -->
			                            </div>
			                            <div class="me-2">${board.boCommentCount}</div>
			
			                        </div>
			
			                    </a>
			                </li>
			            </ul>
			          <hr/>
			        </c:forEach>
			    </table>
			
				<!-- 페이징 처리 하는 부분 -->
				<table class="table text-center">
				    <tr>
				        <td colspan="4" class="text-center">
				            <div>
				                <a class="btn btn-sm" href="boardList?pageNo=1">처음</a>
				                <c:if test="${pager.groupNo>1}">
			                     	<a class="btn btn-sm" href="boardList?pageNo=${pager.startPageNo-1}">이전</a>
			                	</c:if>
				
				                <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				                    <c:if test="${pager.pageNo != i}">
				                        <a class="btn btn-sm" href="boardList?pageNo=${i}">${i}</a>
				                    </c:if>
				                    
				                    <c:if test="${pager.pageNo == i}">
				                        <a class="btn btn-outline-primary btn-sm" href="boardList?pageNo=${i}">${i}</a>
				                    </c:if>
				                </c:forEach>
				               <c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-sm" href="boardList?pageNo=${pager.endPageNo+1}">다음</a>
			                	</c:if>
				                  <a class="btn btn-sm" href="boardList?pageNo=${pager.totalPageNo}">맨끝</a>
				            </div>
				        </td>
				    </tr>
				</table>
			</div>
			
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	
	// 게시글 등록 시 category가 1인지 2인지 확인
	function clickedNoticeButton() {
    	event.preventDefault();
    	// 버튼 클릭시 category 값 변경
        document.getElementById("category").value = 1;
        
    	// 클릭시 색상 변경
        document.getElementById("noticeButton").style.backgroundColor = "#2C4E80";
        document.getElementById("noticeButton").style.color = "#fff";
        document.getElementById("noticeButton").style.borderRadius = "5px";
        
        document.getElementById("reviewButton").style.backgroundColor = "";
        document.getElementById("reviewButton").style.color = "#000";
        document.getElementById("reviewButton").style.borderRadius = "";
    }
    
    function clickedReviewButton() {
    	event.preventDefault();
    	// 버튼 클릭시 category 값 변경
        document.getElementById("category").value = 2; 
        
    	 // 클릭시 색상 변경
        document.getElementById("reviewButton").style.backgroundColor = "#2C4E80";
        document.getElementById("reviewButton").style.color = "#fff";
        document.getElementById("reviewButton").style.borderRadius = "5px";

        document.getElementById("noticeButton").style.backgroundColor = "";
        document.getElementById("noticeButton").style.color = "#000";
        document.getElementById("noticeButton").style.borderRadius = "";
    }
	
    	// 최신순으로 정렬하는 AJAX
    	// 정렬 이후에 페이지를 1을 디폴트로 사용해서 1페이지로 갈 수 있게 설정
    	// 값이 들어오면 들어온 페이지로 감
       function sortByDate(pageNo=1) {
    		// 검색어가 있을 경우 받아와 저장
       var searchInput = $("#searchInput").val();
           	
		 $.ajax({
			url: 'sortByDate',
			type: 'get',
			// 검색어와 페이지 값을 전달
			data: { searchText: searchInput, pageNo: pageNo},
			success: function(response){
				// html 조각을 변경하여 페이지를 변경시킴
				$("#boardContainer").html(response);
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
			}
		 });
    }
    
       // 조회순으로 정렬하는 AJAX
       function sortByHitcount(pageNo=1) {
       var searchInput = $("#searchInput").val();
               	
   		 $.ajax({
   			url: 'sortByHitcount',
   			type: 'get',
   			data: { searchText: searchInput, pageNo: pageNo},
   			success: function(response){
   				
   				$("#boardContainer").html(response);
   			},
   			error: function(xhr, status, error){
   				console.error(xhr.responseText);
   			}
   		 });
        }
       
    	// 댓글순으로 정렬하는 AJAX
        function sortByComment(pageNo=1) { 
        var searchInput = $("#searchInput").val();
     
		 $.ajax({
			url: 'sortByComment',
			type: 'get',
			data: { searchText: searchInput, pageNo: pageNo},
			success: function(response){
				
				$("#boardContainer").html(response);
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
			}
		 });
     }
     	// 좋아요 순으로 정렬하는 AJAX
        function sortByLike(pageNo=1) { 
        var searchInput = $("#searchInput").val();
                	
    		 $.ajax({
    			url: 'sortByLike',
    			type: 'get',
    			data: { searchText: searchInput, pageNo: pageNo},
    			success: function(response){
    				
    				$("#boardContainer").html(response);
    			},
    			error: function(xhr, status, error){
    				console.error(xhr.responseText);
    			}
    		 });
         }
       
       // 검색시 enter키 사용 가능을 위한 함수
       function enterKeyTitle(event){
       	if(event.key === "Enter"){
       		searchTitle(pageNo=1);
       	}
       } 
       
       // 검색 시 AJAX
       function searchTitle(pageNo=1) {
       var searchInput = $("#searchInput").val();
       	
       	$.ajax({
       		url: "searchTitle",
       		type: "get",
       		data: { searchText: searchInput, pageNo: pageNo },
       		success: function(response) {
       			
       			$("#boardContainer").html(response);
       		},
       		error: function(xhr, status, error){
       			console.error(error);
       		}
       	});
       }
        
    </script>
</body>
</html>