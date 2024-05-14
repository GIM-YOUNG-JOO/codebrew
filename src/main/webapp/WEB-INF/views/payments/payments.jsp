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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payments.css">
		<!-- 폰트설정  -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
			
		</script>

		<!-- css 따로 빼면 적용 안되는 설정들 있음 -->
 		<style>
		
		span {
			/* display: flex; */
			justify-content: flex-end;
			align-items: center;
			
		}
		
		form {
			min-width: 600px;
		}

		input, select {
			height: 60px;
			
			border: 1px solid #dddddd;
		}
					
		input::placeholder {
			color: #d9d9d9
		}
			
		.btn {
			font-family: "Do Hyeon", sans-serif;
			font-weight: 400;
			font-style: normal;
			background: #2C4E80; 
			color: white;
		}

		#hovershadow {
		   box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		   transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
		   background: #F0F0F0;
		   
		}
		
		#hovershadow:hover {
		   box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		      rgba(0, 0, 0, 0.22);
		}

		.pfont {
		   font-family: "Do Hyeon", sans-serif;
		   font-style: normal;
		}
		
		
		.menuOption {
			width: 200px;
			justify-content: flex-end;
		}
		
		/*  폰트 적용시 특수문자 원 표기가 안됨 */
		.h5, .h6 {
			font-family: "Do Hyeon", sans-serif;
			font-style: normal;
		}
		
		.optionDetail {
			font-size: small;
		}	
		</style>
		
	</head>

	<body>
	   <%@ include file="/WEB-INF/views/common/header.jsp"%>
	   <div class="px-5 mx-5">
	      
	         <div class="d-flex flex-row">
	            
	
	            <form class="p-3 m-5 w-50 d-flex align-items-center">
	               <div id="hovershadow" class="d-grid gap-4 p-5 rounded-4 w-100">
	                  <div class="row text-center">
	                     <h1 class="pfont">지점 선택</h1>
	                  </div>
	                  <div class="row">
	                     
	                     <div class="col-8 flex-column flex-grow-1 d-grid gap-4 mx-2">
	                        <div class="row flex-grow-1">
	                           <label class="form-label h4 pfont align-text-bottom">이름</label> 
	                           <input class="form-control flex-grow-1" id="nameForm">
	                        </div>
	                        <div class="row">
	                           <label class="form-label h4 pfont">연락처</label> 
	                           <input class="form-control" placeholder="ex) 000-1234-5678">
	                        </div>
	                                <div class="row">
	                           <label class="form-label h4 pfont align-text-bottom">지점 선택</label> 
	                                    <select class="form-select form-control">
	                                        <option selected>주문한 제품을 픽업할 지점을 선택해주세요</option>
	                                        <option value="1">경찰병원역 지점</option>
	                                        <option value="2">가락시장역 지점</option>
	                                        <option value="3">아이티타워 지점</option>
	                                    </select>
	                        </div>
	                                   
	                        <div class="row">
	                           <label class="form-label h4 pfont">요청사항</label> 
	                           <input class="form-control" placeholder="ex) 부재시 문앞에 놓아주세요">
	                        </div>
	                     </div>
	                  </div>
	                  
	                  <div class="d-flex justify-content-around mt-3">
	                     <button class="btn btn-outline-info btn-lg">선택</button>
	                     <button class="btn btn-outline-secondary btn-lg">초기화</button>
	                  </div>
	               </div>
	            </form>
	
	
	
	                
	                <form class="p-3 m-5 w-50 d-flex align-items-center">
	               <div id="hovershadow" class="d-grid gap-4 p-5 rounded-4 w-100">
	                        <div class="row text-center">
	                     <h1 class="pfont">주문 내역</h1>
	                  </div>
	                  <div class="row d-flex">
	                        <div class="d-flex my-3">
	                            <img id="img1" class="rounded-circle " src="/codebrew/resources/image/cut/Americano.jpg" width="50" height="50"/>
	                            <div class="menuOption">
		                            <span class="h5">\${prName} 아메리카노</span>
		                            <span class="optionDetail">\${bopNameName} 원두</span>
		                            <span class="optionDetail">\${sopName} 사이즈</span>
		                            <span class="optionDetail">\${topName} 온도</span>
		                            <span class="optionDetail">\${pdShotCount} 샷</span>
	                            </div>
	                            <span class="h6 flex-grow-1 text-start">\${pdCount} x1</span>
	                            <!-- 폰트 적용시 특수문자 원 표기가 안됨-->
	                            <span class="h6 flex-grow-1">\${prPrice} 4500\</span>
	                        </div>
	                        <div class="d-flex my-3">
	                            <img id="img2" class="rounded-circle" src="/codebrew/resources/image/cut/AppleJuice.png" width="50" height="50"/>
	                            <div class="menuOption">
		                            <span class="h5">아메리카노</span>
		                            <span class="optionDetail">\${bopNameName} 원두</span>
		                            <span class="optionDetail">\${sopName} 사이즈</span>
		                            <span class="optionDetail">\${topName} 온도</span>
		                            <span class="optionDetail">\${pdShotCount} 샷</span>
	                            </div>
	                            <span class="h6 flex-grow-1">x3</span>
	                            <span class="h6 flex-grow-1">4500원</span>
	                        </div>
	                        <div class="d-flex my-3">
	                            <img id="img3" class="rounded-circle" src="/codebrew/resources/image/cut/CaffeLatte.png" width="50" height="50"/>
	                            <div class="menuOption">
		                            <span class="h5">카라멜마끼아또</span>
		                            <span class="optionDetail">\${bopNameName} 원두</span>
		                            <span class="optionDetail">\${sopName} 사이즈</span>
		                            <span class="optionDetail">\${topName} 온도</span>
		                            <span class="optionDetail">\${pdShotCount} 샷</span>
	                            </div>
	                            <span class="h6 flex-grow-1">x2</span>
	                            <span class="h6 flex-grow-1">10000\</span>
	                        </div>
	                        <div class="d-flex my-3">
	                            <img id="img4" class="rounded-circle" src="/codebrew/resources/image/cut/CaramelMacchiato.png" width="50" height="50"/>
	                            <div class="menuOption">
		                            <span class="h5">라떼</span>
		                            <span class="optionDetail">\${bopNameName} 원두</span>
		                            <span class="optionDetail">\${sopName} 사이즈</span>
		                            <span class="optionDetail">\${topName} 온도</span>
		                            <span class="optionDetail">\${pdShotCount} 샷</span>
	                            </div>
	                            <span class="h6 flex-grow-1">x1</span>
	                            <span class="h6 flex-grow-1">5000\</span>
	                        </div>
	                    
	                       
	
	                  <div class="d-flex justify-content-around mt-3">
	                     <button type="button" class="btn btn-outline-info btn-lg" data-bs-toggle="modal" data-bs-target="#myModal">\${sum} 결제</button>
	                     <button class="btn btn-outline-secondary btn-lg">돌아가기</button>
	                  </div>
	
	                        <!-- The Modal -->
	               <div class="modal fade" id="myModal">
	                        <div class="modal-dialog modal-dialog-centered">
	                          <div class="modal-content">
	                      
	                            <!-- Modal Header -->
	                            <div class="modal-header">
	                              <h4 class="modal-title pfont">\${brId} 주문 완료</h4>
	                              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	                            </div>
	                      
	                            <!-- Modal body -->
	                            <div class="modal-body">
	                             		 메뉴를 바로 준비합니다. 10분 후 픽업 해주세요.
	                            </div>
	                      
	                            <!-- Modal footer -->
	                            <div class="modal-footer">
	                              <button type="button" class="btn rounded-pill" data-bs-dismiss="modal">Close</button>
	                            </div>
	                      
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