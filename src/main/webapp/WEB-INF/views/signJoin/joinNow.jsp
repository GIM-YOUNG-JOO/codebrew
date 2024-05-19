<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">

		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		<!-- 사용자 정의 자바스크립트 -->
        <script>
         
        //회원가입 유효성 검사 함수
		function handleCheckData() {
			console.log("입력 데이터를 검사합니다.");
			
			//유효성 검사를 통과하지 못했을 경우 form 태그의 action 기능을 수행하지 않도록 함
			event.preventDefault();
			
			//각 입력 양식의 데이터 검사
			var totalResult = true;
			
			//2)Name 검사 -------------------------------------------------------
			var acNamePattern = /^[가-힣]{2,5}$/;			
			var acNameResult = acNamePattern.test($("#acName").val());
			var el_acName_span = document.querySelector("#acNameSpan");
			if(acNameResult) {
				$("#acNameSpan").removeClass("text-danger");
				$("#acName").removeClass("border-danger");
			} else {
				$("#acNameSpan").addClass("text-danger");
				$("#acName").addClass("border-danger");
				totalResult = false; 
			}
			
			//2)ID 검사 -------------------------------------------------------
			var acIdPattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,10}$/;			
			var acIdResult = acIdPattern.test($("#acId").val());
			var el_acId_span = document.querySelector("#acIdSpan");
			if(acIdResult) {
				$("#acIdSpan").removeClass("text-danger");
				$("#acId").removeClass("border-danger");
			} else {
				$("#acIdSpan").addClass("text-danger");
				$("#acId").addClass("border-danger");
				totalResult = false; 
			}
			
			//3)Password 검사 -------------------------------------------------------
			
			var acPasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
			var acPasswordResult = acPasswordPattern.test($("#acPassword").val());
			var el_acPassword_span = document.querySelector("#acPasswordSpan");
			if(acPasswordResult) {
				$("#acPasswordSpan").removeClass("text-danger");
				$("#acPassword").removeClass("border-danger");
			} else {
				$("#acPasswordSpan").addClass("text-danger");
				$("#acPassword").addClass("border-danger");
				totalResult = false;
			}
			
			//4)Phon 검사 -------------------------------------------------------
			
			var acTelPattern = /^(010|011)-\d{3,4}-\d{4}$/;
			var acTelResult = acTelPattern.test($("#acTel").val());
			var el_acTel_span = document.querySelector("#acTelSpan");
			if(acTelResult) {
				$("#acTelSpan").removeClass("text-danger");
				$("#acTel").removeClass("border-danger");
			} else {
				$("#acTelSpan").text("전화번호 형식이 아닙니다.");
				$("#acTelSpan").addClass("text-danger");
				$("#acTel").addClass("border-danger");
				totalResult = false;
			}
			
			//5)Email 검사 -------------------------------------------------------
			var acEmailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			var acEmailResult = acEmailPattern.test($("#acEmail").val());
			if(acEmailResult) {
				$("#acEmailSpan").removeClass("text-danger");
				$("#acEmail").removeClass("border-danger");
			} else {
				$("#acEmailSpan").text("이메일 형식이 아닙니다.");
				$("#acEmailSpan").addClass("text-danger");
				$("#acEmail").addClass("border-danger");
				totalResult = false;
			}
			
			//6)전체 유효성 검사 결과가 true일 경우  --------------------------------------------------
			if(totalResult) {
				
				$("#joinNowForm")[0].submit();
				//$("#joinForm").submit("#joinForm");
				//submit()은 엘리먼트의 메소드이기 때문에 제이쿼리 객체로 사용은 불가능
				//제이쿼리에는 서밋과 비슷한 메소드 없음
				//제이쿼리 객체의 인덱스를 통해 엘리먼트의 메소드를 사용해줌
			}
		} 
        </script>
        
        <style>
        	* {
			  font-family: "Do Hyeon", sans-serif;
			  font-weight: 400;
			  font-style: normal;
			}           
           
            #joinNowBtn {
                float: right;
            }

            #joinNowPage {
                justify-content: center;
                align-items:center;
            }
            
            #joinNowForm {
            	min-width: 500px;  
            }
          
        </style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
   
    <div id="joinNowPage" class="d-flex flex-column py-3 px-5 mx-5">
        <div>
            <div id="signInMent" class="m-1 p-1 text-center"><h2 class="mt-3">Create an account</h2></div>
        </div>
        <div class="border rounded m-5 p-3" style="background: #F0F0F0">
            <!-- 회원가입폼 -->
            <form id="joinNowForm" 
            	  name="joinNowForm"
            	  method="post" 
            	  action="signUp" 
            	  onsubmit="handleCheckData()"
            	  novalidate>
                <div class="m-2 p-2 text-start"><span class="star">* </span> indicates required field</div>
                <!-- 항목 -->
                	<div class="my-3">
                	<label for="acName" class="form-lable px-4">* Name</label>
                    <div class="d-flex"><input id="acName" name="acName" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) 홍길동"></div>
                    <span id="acNameSpan" class="form-text px-4">한글 이름 2~5자 이내</span>
                    <%-- <form:errors path="account.acName"/> --%>
                	</div>
                	
                	<div class="my-3">
                	<label for="acId" class="form-lable px-4">* Id</label>
                    <div class="d-flex"><input id="acId" name="acId" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2"  placeholder=""></div>
                    <span id="acIdSpan" class="form-text px-4">알파벳과 숫자를 혼용해서 6자 이상 10장 이하</span>
                    <%-- <form:errors path="account.acId"/> --%>
                	</div>
                	
                	<div class="my-3">
                	<label for="acPassword" class="form-lable px-4">* Password</label>
                    <div class="d-flex"><input id="acPassword" name="acPassword" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder=""></div>
                    <span id="acPasswordSpan" class="form-text px-4">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하</span>
                    <%-- <form:errors path="account.acPassword"/> --%>
                	</div>
                	
                	<div class="my-3">
                	<label for="acTel" class="form-lable px-4">* PhoneNumber</label>
                    <div class="d-flex"><input id="acTel" name="acTel" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) 010-123-1234"></div>
                    <span id="acTelSpan" class="form-text px-4">'-'를 넣어서 작성해주세요</span>
                    <%-- <form:errors path="account.acTel"/> --%>
                	</div>
                	
                	<div class="my-3">
                	<label for="acEmail" class="form-lable px-4">* E-mail</label>
                    <div class="d-flex"><input id="acEmail" name="acEmail" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) abc123@naver.com"></div>
                    <span id="acEmailSpan" class="form-text px-4">'@'를 넣어서 작성해주세요</span>
                    <%-- <form:errors path="account.acEmail"/> --%>
                	</div>
                	
                <!-- 제출 버튼 -->
                <div>
                    <button id="joinNowBtn" class="m-2 p-2 btn btn-lg btn-success rounded-pill border-secondary" type="submit" style="background: #1f3933; color: white">Join Now</button>
                </div>
            </form>
        </div>


     
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>    
</body>

</html>