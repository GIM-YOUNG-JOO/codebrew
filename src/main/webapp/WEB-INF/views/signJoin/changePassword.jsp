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
            <form id="changePasswordForm" method="post" action="${pageContext.request.contextPath}/login">
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
                    <button id="changePasswordBtn" class="m-2 p-2 btn btn-lg rounded-pill border-secondary" type="submit" style="background: #2C4E80; color: white;">Edit</button>
                </div>
            </form>
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
</body>

</html>