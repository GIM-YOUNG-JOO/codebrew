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
	                <h6 id="SelectingBranch" class="rounded text-center p-2 bg-warning-subtle">지점선택</h6>
	               
	                <div class="d-flex align-items-center mx-3 my-4">이름  &#160; &#160; &#160;&#160; <input class="p-1 flex-grow-1 ms-2" placeholder="이름을 입력해 주세요."></input></div>
	                <div class="d-flex align-items-center mx-3 my-4">연락처 &#160; &#160; <input class="p-1 flex-grow-1 ms-2" placeholder="000-1234-5678"></input></div>
	                <div class="dropdown d-flex align-items-center mx-3 my-4">지점 선택 
	                    <button class="btn btn-light dropdown-toggle flex-grow-1  ms-2" type="button" id="requestDropdownBtn" data-bs-toggle="dropdown" aria-expanded="false">
	                      	주문한 제품을 픽업할 지점을 선택해주세요
	                    </button>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
	                      <li><a class="dropdown-item" href="#">경찰병원역 지점</a></li>
	                      <li><a class="dropdown-item" href="#">가락시장역 지점</a></li>
	                      <li><a class="dropdown-item" href="#">아이티타워 지점</a></li>
	                    </ul>
	                </div>
	       
	                <div class="d-flex align-items-center mx-3 my-4">요청 사항 <input class="p-1 flex-grow-1 ms-2" placeholder="지점에 전달할 사항을 입력해주세요."></input></div>
	               
	                
	            </form>
	         
	        </div>
	
	        <div class="flex-container3 p-5" style="width: 50%; min-width: 600px;">
	
	            <!-- 주문 내역 폼 -->
	            <form class="border-secondary p-3" >
	                <h6 id="orderHistory" class="rounded text-center p-2 bg-warning-subtle">주문내역</h6>
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
	                <div class="d-flex m-3" ><button type="button" class="btn btn-success btn-lg rounded-pill flex-grow-1 p-3 mx-3" data-bs-toggle="modal" data-bs-target="#myModal">$670 Pay Now </button></div>
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
					        <button type="button" class="btn btn-success rounded-pill" data-bs-dismiss="modal">Close</button>
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
