<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Insert title here</title>
				
		<!-- Bootstrap5 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payments.css">
		<!-- 폰트설정  -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
		</script>
      
        <style>
		
			
        </style>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	    <div class="flex-container1 d-flex">
	    	
	        <div class="flex-container2 border-end p-5" style="width: 50%; min-width: 600px;">
	            <!-- 지점 선택 폼 -->
	            <form class="border-secondary p-3">
	                <h3 id="SelectingBranch" class="text-center p-4 mb-5 border-bottom border-primary border-5" style="--bs-border-opacity: .5;">지 점 선 택</h3>
	                <div>
	                </div>
	                <div class="SelectingBranchForm d-flex align-items-center mx-3 my-4">
	                	<h5>이름</h5>
	                	<input class="p-2 flex-grow-1 ms-2 rounded" placeholder="ex) 김자바"></input>
	                </div>
	                <div class="SelectingBranchForm d-flex align-items-center mx-3 my-4">
	                	<h5 class="">연락처</h5>
	               		<input class="p-2 flex-grow-1 ms-2 rounded" placeholder="ex) 000-1234-5678"></input>
	                </div>
					<div class="SelectingBranchForm d-flex align-items-center mx-3 my-4">
						<h5>지점 선택</h5>
						<select class="flex-grow-1 p-2 ms-2 rounded">
							<option selected>주문한 제품을 픽업할 지점을 선택해주세요</option>
							<option value="1">경찰병원역 지점</option>
							<option value="2">가락시장역 지점</option>
							<option value="3">아이티타워 지점</option>
						</select>
					</div>	               
	               
	            	<div class="SelectingBranchForm d-flex align-items-center mx-3 my-4">
	            		<h5>요청 사항</h5>   
	               		<input class="p-2 flex-grow-1 ms-2 rounded" placeholder="ex) 부재시 문앞에 놓아주세요"></input>
	                </div>
	            </form>
	        </div>
	
	
	        <div class="flex-container3 p-5" style="width: 50%; min-width: 600px;">
	            <!-- 주문 내역 폼 -->
	            <form class="border-secondary p-3" >
	                <h3 id="orderHistory" class="text-center p-4 mb-5 border-bottom border-primary border-5" style="--bs-border-opacity: .5;">주 문 내 역</h3>
					<div class="d-flex m-3">
						<img id="img1" class="rounded-circle" src="/codebrew/resources/image/cut/Americano.jpg" width="50" height="50"/>
						<span class="flex-grow-1">x1</span>
						<span class="flex-grow-1">670$</span>
					</div>
					<div class="d-flex m-3">
						<img id="img2" class="rounded-circle" src="/codebrew/resources/image/cut/AppleJuice.png" width="50" height="50"/>
						<span class="flex-grow-1">x1</span>
						<span class="flex-grow-1">670$</span>
					</div>
					<div class="d-flex m-3">
						<img id="img3" class="rounded-circle" src="/codebrew/resources/image/cut/CaffeLatte.png" width="50" height="50"/>
						<span class="flex-grow-1">x1</span>
						<span class="flex-grow-1">670$</span>
					</div>
					<div class="d-flex m-3">
						<img id="img4" class="rounded-circle" src="/codebrew/resources/image/cut/CaramelMacchiato.png" width="50" height="50"/>
						<span class="flex-grow-1">x1</span>
						<span class="flex-grow-1">670$</span>
					</div>
	           		
	           		<!-- 결제 버튼 -->
	                <div class="d-flex m-3" ><button type="button" class="btn btn-lg rounded-pill flex-grow-1 p-3 mx-3 my-5" data-bs-toggle="modal" data-bs-target="#myModal" >${sum} sum &#8361; Pay Now </button></div>
					<!-- The Modal -->
					<div class="modal fade" id="myModal">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">Success</h4>
					        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					        주문이 완료되었습니다.
					      </div>
					
					      <!-- Modal footer -->
					      <div class="modal-footer">
					        <button type="button" class="btn rounded-pill" data-bs-dismiss="modal">Close</button>
					      </div>
					
					    </div>
					  </div>
					</div>
	            </form>
	        
	        </div>
	
	      </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>

</html>
