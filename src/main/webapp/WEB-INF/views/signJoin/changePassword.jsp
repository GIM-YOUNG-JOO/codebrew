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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
		<!-- 폰트설정  -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		</script>
        <script>

        </script>
        <style>
        	* {
			  font-family: "Do Hyeon", sans-serif;
			  font-weight: 400;
			  font-style: normal;
			}
			
			button {
				font-family: "Do Hyeon", sans-serif;
			    font-weight: 400;
			    font-style: normal;
			}

            #changePasswordPage {
                justify-content: center;
                align-items: center;
            }
            
            #changePasswordForm {
            	min-width: 500px;  
            }
            

        </style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
   
    <div id="changePasswordPage" class="d-flex flex-column py-3 px-5 mx-5">
        <div class="">
            <div id="changePasswordMent" class="m-1 p-1 text-center" ><h2 class="mt-3">Change Your Password</h2></div>
        </div>
        <div class="border border-secondar rounded m-5 p-3" style="background: #F0F0F0">
            <!-- 비밀번호 찾기 폼 -->
				<!--<form id="changePasswordForm" method="post" action="findPwByIdAndTel"> -->
			<div style="min-width: 500px;">
                <div class="m-2 p-2 text-start"><span class="star">* </span> indicates required field</div>
                <!-- 아이디/이름/번호 입력 폼 -->
				<div class="my-3">
				    <label for="acId" class="form-lable px-4">* Id</label>
				    <div class="d-flex"><input id="acId" name="acId" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) user123"></div>
			    </div>
				<div class="my-3">
				    <label for="acName" class="form-lable px-4">* Name</label>
				    <div class="d-flex"><input id="acName" name="acName" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) 홍길동"></div>
			    </div>
				<div class="my-3">
				    <label for="acTel" class="form-lable px-4">* PhoneNumber</label>
				    <div class="d-flex"><input id="acTel" name="acTel" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) 010-123-1234"></div>		
			    </div>         
                	
                <!-- 비밀번호 찾기 폼 제출 버튼 -->
                <div class="text-center">
                    <button id="changePasswordBtn" class="m-2 p-2 btn btn-lg rounded-pill border-secondary" onclick="findPassword()" style="background: #1f3933; color: white;">submit</button>
                </div>
                <div id="hiddenDiv" style="display: none;"></div>
               <!--  <div style="margin-top: 10px; font-size: 30px; color: #2C4E80; text-align: center;">정확한 정보를 입력하세요</div> -->
            <!-- </form> -->
            
            <!-- 모달 창 생성 하는 html -->
            <!-- 모달 창 -->
		<div class="modal" id="myModal">
		    <div class="modal-dialog">
			    <form id="updatePw" method="post" action="updatePassword">
			        <div class="modal-content">
			            <!-- 모달 헤더 -->
			            <div class="modal-header">
			                <h4 class="modal-title">비밀 번호를 수정해주세요</h4>
			                
			            </div>
			            <!-- 모달 본문 -->
			            <div class="modal-body">
			             <!-- hidden input을 사용하여 아이디 값을 전달 -->
                  		 <input type="hidden" id="modalAcId" name="acId">
			                <div class="my-3">
							    <label for="acId" class="form-lable px-4"> 수정할 비밀번호</label>
							    <div class="d-flex">
							    	<input id="acPassword" name="acPassword" type="password" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="">
							    </div>
							    <span id="acPasswordSpan" class="form-text px-4">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하</span>
			  	  			</div>
			            </div>
			            <!-- 모달 푸터 -->
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" onclick="closeModal()">취소</button>
			                <button type="submit" class="btn btn-secondary" onclick="submitModalForm()">수정</button>
			            </div>
			        </div>
		     	 </form>
		    </div>
		</div>
           
            
        </div>
      </div>

		<!---------------------------------------------------------------------------------------------------->
		
        <!-- 회원가입 이동-->
        <div class="text-center m-3 p-3" style="min-width: 450px;  max-width: 900px;">
            <div id="joinNowMent">
                <h5>JOIN CODEBREW WEBSITE</h5>
                <h6>상품 주문 및 결제는 회원가입 시에 제공되는 서비스입니다.</h6>
            </div>
            <div>
            	<a href="${pageContext.request.contextPath}/signJoin/joinNow">
            		<button name="joinNowBtn" class="m-2 p-2 rounded-pill border" type="button" href="">Join now</button>
            	</a>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	// 비밀번호를 찾는 함수 - AJAX
	function findPassword() {
	var acId = $("#acId").val();
	var acName = $("#acName").val();
	var acTel = $("#acTel").val();
	
	var account = {
			acId,
			acName,
			acTel
	}
	    	
		 $.ajax({
			url: 'findPassword',
			type: 'post',
			data: account,
			success: function(response){
				console.log(response.result);
				// 값이 다를 경우 result에 0를 넣어서 아래 내용을 출력하게 함
				if(response.result == 0){
					var failedHtml = '<div style="margin-top: 10px; font-size: 30px; color: #1f3933; text-align: center;">' + '정확한 정보를 입력하세요' + '</div>';
					$("#hiddenDiv").html(failedHtml);
					$("#hiddenDiv").show();
				} else {
					// 값이 맞을 경우 모달을 실행하게 함
					console.info("실행")
					console.info("acId: " + acId);
					$('#modalAcId').val(acId);
					$("#myModal").modal('show');
				}
				
			},
			error: function(xhr, status, error){
				
			}
		 }); 
	}
	
	function closeModal() {
		$('#myModal').modal('hide');
	}
	
	function submitModalForm() {

		//유효성 검사를 통과하지 못했을 경우 form 태그의 action 기능을 수행하지 않도록 함
		event.preventDefault();
		
		//각 입력 양식의 데이터 검사
		var totalResult = true;
		
		//3)Password 검사 -------------------------------------------------------
		var acPasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
		var acPasswordResult = acPasswordPattern.test($("#acPassword").val());
		var el_acPassword_span = document.querySelector("#acPasswordSpan");
		if(acPasswordResult) {
			$("#acPasswordSpan").removeClass("text-danger");
			$("#acPassword").removeClass("border-danger");
		} else {
			$("#acTelSpan").text("비밀번호 형식이 아닙니다");
			$("#acPasswordSpan").addClass("text-danger");
			$("#acPassword").addClass("border-danger");
			totalResult = false;
		}
		
		
		if(totalResult) {
			
			$('#updatePw')[0].submit();
			//$("#joinForm").submit("#joinForm");
			//submit()은 엘리먼트의 메소드이기 때문에 제이쿼리 객체로 사용은 불가능
			//제이쿼리에는 서밋과 비슷한 메소드 없음
			//제이쿼리 객체의 인덱스를 통해 엘리먼트의 메소드를 사용해줌
		}
		
	}

</script>
</body>

</html>