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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- jquery 외부 라이브러리 사용 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- alert 레이아웃 외부 라이브러리 사용 설정  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardDetail.css"> --%>
<style>
.card {
	margin-top: 10px;
}
.like_button:hover {
	cursor: pointer;
}
</style>
<script type="text/javascript">
function commentRegist(boId) {
	console.log("commentRegist() 실행");
	var bocContents = $('#bocContents').val();
	
	//댓글 미입력시 입력하라는 문구 출력
	if (bocContents == null || bocContents == '') {
		swal({
		    title: "Error",
		    text: "댓글을 입력해주세요",
		    icon: "error" //"info,success,warning,error" 중 택1
		});
	}
	
	var formData = { 
			boId, 
			bocContents					
	} 
	$.ajax({
		url : "boardCommentAjax",
		type : "post",
		contentType: "application/json",
		data : JSON.stringify(formData),
		success: function(response){
			console.log("보내기 성공");
			console.log(response);
			$("#boardCommentContainer").html(response);
			
			$('#bocContents').val('');
		}
	});
	}
function deleteTag(element){
	var parent = element.parentNode;
	parent.parentNode.remove()
}	
	
function boardCommentDelete(bocId, boId, element) {
	console.log("boardDelete() 실행", boId);
	
	var boardComment = {
			bocId,
			boId
	}
			 
	$.ajax({
		url : "boardCommentDelete",
		type : "post",
		contentType: "application/json",
		data : JSON.stringify(boardComment),
		success: function(response){
			console.log("보드커맨트 삭제 성공");
			console.log(response);
			
		}
	});
	deleteTag(element);
	}
function boardLike(boId, bolState){
	var boId = boId;
	var bolState = bolState;
	var account = ${board.boLike};
	var like_container = document.getElementById('board_like_account');
	var boLike = {
			boId,
			bolState	
	}
	
	$.ajax({
		url : "boardLike",
		type : "post",
		contentType: "application/json",
		data : JSON.stringify(boLike),
		success: function(response){
			if(response.Num == 1){
				swal({
				    title: "Information",
				    text: "게시물을 추천했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = account + 1;
				like_container.textContent = account;
			}else if(response.Num == 2){
				swal({
				    title: "Information",
				    text: "게시물을 비추천했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = account - 1;
				like_container.textContent = account;
			}else if(response.Num == 3){
				swal({
				    title: "Information",
				    text: "게시물 추천을 취소했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = account
				like_container.textContent = account;
			}else if(response.Num == 4){
				swal({
				    title: "Information",
				    text: "게시물 비추천을 취소했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = account
				like_container.textContent = account;
			}
			
		}
	});
}
function boardCommentLike(bocId, boclState){
	var bocId = bocId;
	var boclState = boclState;
	var account = $('#container'+bocId).val();
	var like_container = document.getElementById('board_like_account'+bocId);
	var bocLike = {
			bocId,
			boclState	
	}
	
	$.ajax({
		url : "boardCommentLike",
		type : "post",
		contentType: "application/json",
		data : JSON.stringify(bocLike),
		success: function(response){
			if(response.Num == 1){
				swal({
				    title: "Information",
				    text: "댓글을 추천했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = +account + 1;
				like_container.textContent = account;
			}else if(response.Num == 2){
				swal({
				    title: "Information",
				    text: "댓글을 비추천했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = +account - 1;
				like_container.textContent = account;
			}else if(response.Num == 3){
				swal({
				    title: "Information",
				    text: "댓글 추천을 취소했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = +account
				like_container.textContent = account;
			}else if(response.Num == 4){
				swal({
				    title: "Information",
				    text: "댓글 비추천을 취소했습니다.",
				    icon: "info" //"info,success,warning,error" 중 택1
				});
				account = +account
				like_container.textContent = account;
			}
			
		}
	});
}


</script>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="d-flex">
			<div
				class="border p-5 d-flex flex-column position-sticky top-0 vh-100"
				style="width: 50%;">
				<div class="d-flex">
					<div class="h1">${board.boTitle}</div>
					<div
						class="d-flex justify-content-end align-items-center flex-grow-1">
						<button class="btn btn-lg bi bi-hand-thumbs-up" onclick="boardLike('${board.boId}',1)"></button>
						<span class="h5 m-1" id="board_like_account">${board.boLike}</span>
						<button class="btn btn-lg bi bi-hand-thumbs-down" onclick="boardLike('${board.boId}',-1)"></button>
					</div>
				</div>
				<hr />
				<div class="p-4 border shadow flex-grow-1 mb-5" style="width: 100%;">
					<p>${board.boContent}</p>
				</div>
				<c:if test="${board.acId eq user}">
				<div style="margin-left:420px; margin-bottom:40px;">
				<a href="${pageContext.request.contextPath}/board/updateRegister?&boId=${board.boId}">
					<button class="btn btn-dark" type="button">수정</button>
				</a>
					<form method="post" action="boardDelete" style="display: inline-block;">
						<input type="hidden" name=boId value="${board.boId}">
						<button class="btn btn-dark" name="boId">삭제</button>
					</form>
				</div>
				</c:if>
				<div class="input-group shadow" style="width: 100%; height: 15%;">
					<textarea class="form-control" Id="bocContents" aria-label="With textarea"
						style="background-color: white;"></textarea>
					<button class="btn btn-dark" onclick="commentRegist('${board.boId}')">댓글 등록</button>
				</div>
			</div>
			<div style="width: 50%">
				<div class="d-flex justify-content-center p-5">
					<img
						src="data:image/jpeg;base64,${board.boImageOut}"
						alt="" width="auto" height="300px">
				</div>
				<div class="d-flex flex-grow-1 align-items-center flex-column" id="boardCommentContainer">
					<div class="h1">Comment</div>
					<c:forEach var="boardComment" items="${boardCommentList}">
						<div class="card" style="width: 80%;">
							<div class="card-body">
								<h5 class="card-title">${boardComment.acId}</h5>
								<h6 class="card-subtitle mb-2 text-body-secondary">${boardComment.bocNewdate}</h6>
								<p class="card-text">${boardComment.bocContents}</p>
								<div class="card-link text-end">
									<i class="bi bi-hand-thumbs-up like_button" onclick="boardCommentLike('${boardComment.bocId}',1)"></i> <span class="ms-2 me-2" id="board_like_account${boardComment.bocId}">${boardComment.bocLike}</span>
									<i class="bi bi-hand-thumbs-down like_button" onclick="boardCommentLike('${boardComment.bocId}',-1)"></i>
									<input type="hidden" id="container${boardComment.bocId}" value="${boardComment.bocLike}">
								</div>
								<c:if test="${boardComment.acId eq user}">
								<div style="width: 100%; height: 30px;"></div>
								<button type="button" class="btn btn-dark" style="float:right;" onclick="boardCommentDelete('${boardComment.bocId}','${boardComment.boId}',this)">삭제</button>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>